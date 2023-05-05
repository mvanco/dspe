package cz.vutbr.xvanco02.peprivatefiles;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Scanner;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.util.Log;
import android.widget.Toast;

public abstract class Utilities {
	
	public static final String CONF_TAG = "ConfigurationFile";
	
	public static final String PREFS_FILE_SCANNING = "file_scanning";
	public static final String PREFS_CONTENT_SCANNING = "content_scaning";
	public static final String PREFS_RESTRICTION = "restriction";
	public static final String PREFS_RESTRICTION_TYPES = "restriction_types";
	public static final String PREFS_RESTRICTION_METHODS = "restriction_methods";
	public static final String PREFS_THREAT_LEVEL = "threat_level";
	public static final String PREFS_THREAT_LEVEL_TYPES = "threat_level_types";
	public static final String PREFS_LOGGING = "logging";
	public static final String PREFS_LOGGING_DELETE = "delete_log";
	
	private static String CONFIGURATION_FILENAME = "pe_private_files.conf"; //in getFilesDir() location
	
	public static void saveToFile(Context context, List<Map<String, String>> data) throws IOException {
		
		List<Map<String, String>> previousData = null;
		if (data == null) { //tries to read data from previous content
			previousData = new ArrayList<Map<String, String>>();
			//try {
				//loadPathsFromFile(context, previousData);
			//} catch (IOException ex) {
				//continue with empty paths without crash :)
			//}
		}
		
		SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context); //reading
		FileOutputStream fw = context.openFileOutput(CONFIGURATION_FILENAME, Context.MODE_WORLD_READABLE);

		String buffer = "";

		boolean fileScanning = prefs.getBoolean("file_scanning", false);
		boolean contentScanning = prefs.getBoolean("content_scanning", false);
		
		String module = "0";
		if (fileScanning) {
			if (contentScanning) {
				module = "2";
			}
			else {
				module = "1";
			}
		}
		
		buffer += module + " "; //0-without tainting, 1-file-based scanning, 2-content-based scanning
		
		
		String restrictionType = "0";
		if (prefs.getBoolean("restriction", true)) {
			restrictionType = prefs.getString("restriction_types", "0");
		}
		buffer += restrictionType + " ";
		
		String restrictionMethod = "0";
		if (prefs.getBoolean("restriction", true)) {
			restrictionMethod = prefs.getString("restriction_methods", "0");
		}
		buffer += restrictionMethod + " ";
		
		
		String threatLevel = "0";
		if (prefs.getBoolean("file_scanning",  false) && prefs.getBoolean("threat_level", false)) {
			threatLevel = prefs.getString("threat_level_types", "0");
		}
		buffer += threatLevel + " "; //type of restriction according to array
		
		buffer += (prefs.getBoolean("logging", false)) ? 1 : 0;
		
		buffer += "\n";
		
		if (data != null) {
			for (Map<String, String> map : data) {
				buffer += map.get("path") + "\n";
			}
		}
		else {
			for (Map<String, String> map : previousData) {
				buffer += map.get("path") + "\n";
			}
		}
		
		fw.write(buffer.getBytes());
		fw.close();
		
		//makeSnapshotConf(context);
	}
	
	public static void loadFromFile(Context context, List<Map<String, String>> data) {
		SharedPreferences.Editor prefs = PreferenceManager.getDefaultSharedPreferences(context).edit();
		
		FileInputStream fr = null;
		try {
			fr = context.openFileInput(CONFIGURATION_FILENAME);
		} catch (FileNotFoundException e) {
			loadDefault(context); //shared preferences only
			return;
		}
		BufferedReader br = new BufferedReader(new InputStreamReader(fr));
		
		String line = null;
		try {
			line = br.readLine();
		} catch (IOException e2) {
			e2.printStackTrace();
		}
		
		if (line == null) {
			loadDefault(context);
			try {
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return; //if empty file read default as well
		}

		try {
			
			Scanner scanner = null;
			scanner = new Scanner(line);
			
			int module = scanner.nextInt();
			if (module == 0) {
				prefs.putBoolean("file_scanning", false);
				prefs.putBoolean("content_scanning", false);
			}
			else {
				prefs.putBoolean("file_scanning", true);
				boolean contentScanning = (module == 2) ? true : false;	
				prefs.putBoolean("content_scanning", contentScanning);
			}
			
			int restrictionType = scanner.nextInt();
			if (restrictionType == 0) {
				prefs.putBoolean("restriction", false);
			}
			else {
				prefs.putBoolean("restriction", true);
				prefs.putString("restriction_types", String.valueOf(restrictionType));
			}
			
			int restrictionMethod = scanner.nextInt();
			if (restrictionMethod == 0) {
				prefs.putBoolean("restriction", false);
			}
			else {
				prefs.putBoolean("restriction", true);
				prefs.putString("restriction_methods", String.valueOf(restrictionMethod));
			}
			
			int threatLevel = scanner.nextInt();
			if (threatLevel == 0) {
				prefs.putBoolean("threat_level", false);
			}
			else {
				prefs.putBoolean("threat_level", true);
				prefs.putString("threat_level_types", String.valueOf(threatLevel));
			}
			
			int logging = scanner.nextInt();
			if (logging == 0) {
				prefs.putBoolean("logging", false);
			}
			else {
				prefs.putBoolean("logging", true);
			}
			
			prefs.commit();
			scanner.close();
		} catch (IllegalStateException ex) {
			loadDefault(context);
		} catch (InputMismatchException ex) {
			loadDefault(context);
		} catch (NoSuchElementException ex) {
			loadDefault(context);
		} 
		
		line = "";
		try {
			while ((line = br.readLine()) != null) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("path", line);
				int imageID;
				if ( (new File(line)).isFile() ) {
					imageID = R.drawable.file;
				}
				else {
					imageID = R.drawable.folder;
				}
				map.put("icon", Integer.toString(imageID));
				data.add(map);
			}
			
			fr.close();
			
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	public static void loadPathsFromFile(Context context, List<Map<String, String>> data) throws IOException {//does not change preferences
		
		FileInputStream fr = null;
		try {
			fr = context.openFileInput(CONFIGURATION_FILENAME);
		} catch (FileNotFoundException e) {
			return; // not loaded, data are therefore empty
		}
		BufferedReader br = new BufferedReader(new InputStreamReader(fr));
		
		String line = br.readLine();
		if (line == null) {
			br.close();
			return; //if empty file read default as well
		}
		
		line = "";
		while ((line = br.readLine()) != null) { //reads from second line
			Map<String, String> map = new HashMap<String, String>();
			map.put("path", line);
			data.add(map);
		}
		
		fr.close();
	}
	
	public static void makeSnapshotConf(Context context) {//does not change preferences
		
		FileInputStream fr = null;
		try {
			fr = context.openFileInput(CONFIGURATION_FILENAME);
		} catch (FileNotFoundException e) {
			return; // not loaded, data are therefore empty
		}
		BufferedReader br = new BufferedReader(new InputStreamReader(fr));
		
		String line = "";
		try {
			while ((line = br.readLine()) != null) { //reads from second line
				Log.d(CONF_TAG, line);
			}
			fr.close();
		}
		catch (IOException e) {}
	}
	
	public static void loadDefault(Context context) {
		SharedPreferences.Editor prefs = PreferenceManager.getDefaultSharedPreferences(context).edit();
		prefs.putBoolean("file_scanning", true);
		prefs.putBoolean("content_scanning", false);
		prefs.putBoolean("restriction", true);
		prefs.putString("restriction_types", "1");
		prefs.putString("restriction_methods", "3");
		prefs.putBoolean("threat_level", false);
		prefs.putString("threat_level_types", "1");
		prefs.commit();
	}
	
	@SuppressLint("NewApi")
	public static void displayResetDialog(Activity activity) {
	    boolean isFirstRun = activity.getSharedPreferences("PREFERENCE", activity.MODE_PRIVATE).getBoolean("display_reset_dialog", true);
	    if (isFirstRun){
	        new AlertDialog.Builder(activity)
	        .setTitle(activity.getString(R.string.alert_dialog_reset_title))
	        .setMessage(activity.getString(R.string.alert_dialog_reset_message))
	        .setCancelable(false)
	        .setPositiveButton(activity.getString(R.string.alert_dialog_reset_buttontext), new OnClickListener() {
	            @Override
	            public void onClick(DialogInterface dialog, int which) {
	                // nothing, just close dialog
	            }
	        }).create().show();

	        activity.getSharedPreferences("PREFERENCE", activity.MODE_PRIVATE)
	          .edit()
	          .putBoolean("display_reset_dialog", false)
	          .apply();
	    }
	}

	@SuppressLint("NewApi")
	public static void displayChangedRestrictionDialog(Activity activity) {
	    boolean isFirstRun = activity.getSharedPreferences("PREFERENCE", activity.MODE_PRIVATE).getBoolean("display_changed_restriction_dialog", true);
	    if (isFirstRun){
	        new AlertDialog.Builder(activity)
	        .setTitle(activity.getString(R.string.alert_dialog_restriction_changed_title))
	        .setMessage(activity.getString(R.string.alert_dialog_restriction_changed_message))
	        .setCancelable(false)
	        .setPositiveButton(activity.getString(R.string.alert_dialog_restriction_changed_buttontext), new OnClickListener() {
	            @Override
	            public void onClick(DialogInterface dialog, int which) {
	                // nothing, just close dialog
	            }
	        }).create().show();

	        activity.getSharedPreferences("PREFERENCE", activity.MODE_PRIVATE)
	          .edit()
	          .putBoolean("display_changed_restriction_dialog", false)
	          .apply();
	    }
	}
}
