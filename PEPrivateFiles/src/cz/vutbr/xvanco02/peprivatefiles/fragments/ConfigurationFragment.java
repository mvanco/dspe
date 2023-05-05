package cz.vutbr.xvanco02.peprivatefiles.fragments;

import java.io.File;
import java.io.IOException;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;
import android.os.Bundle;
import android.os.Environment;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceManager;
import android.support.v4.preference.PreferenceFragment;
import android.util.Log;
import android.widget.Toast;
import cz.vutbr.xvanco02.peprivatefiles.R;
import cz.vutbr.xvanco02.peprivatefiles.Utilities;

/**
 * A placeholder fragment containing a simple view.
 */
public class ConfigurationFragment extends PreferenceFragment {
	
	private static final String INTERNAL_STORAGE_DIR = "/sdcard";
	
	private static final String LOG_FILE = "pe_log.txt";
	private static final String LOG_FILE_DEBUG = "pe_log_debug.txt";
	private static final String LOG_FILE_ERROR = "pe_log_error.txt";
	private static final String LOG_FILE_TAINTMAP = "pe_log_taintmap.txt";
	private static final String LOG_FILE_JAVA = "pe_log_java";
	
	/**
	 * Returns a new instance of this fragment for the given section number.
	 */
	public static ConfigurationFragment newInstance() {
		ConfigurationFragment fragment = new ConfigurationFragment();
		Bundle args = new Bundle();
		fragment.setArguments(args);
		return fragment;
	}
	
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
		OnSharedPreferenceChangeListener listener = new SharedPreferences.OnSharedPreferenceChangeListener() {
			public void onSharedPreferenceChanged(SharedPreferences prefs, String key) {
				try {					
					Utilities.saveToFile(getActivity(), null);
					
					if ( !key.equals(Utilities.PREFS_RESTRICTION) && !key.equals(Utilities.PREFS_RESTRICTION_TYPES) ) {
						Utilities.displayResetDialog(getActivity());
					}
					else {
						Utilities.displayChangedRestrictionDialog(getActivity());
					}
				} catch (IOException e) {
					Toast.makeText(getActivity(), getString(R.string.private_files_toast_cannot), Toast.LENGTH_LONG).show();
				}
			}
		};
		PreferenceManager.getDefaultSharedPreferences(getActivity()).registerOnSharedPreferenceChangeListener(listener);
		
        addPreferencesFromResource(R.xml.preferences);
        
		OnPreferenceClickListener clickListener = new OnPreferenceClickListener() {

			@Override
			public boolean onPreferenceClick(Preference preference) {
				if (preference.getKey().equals(Utilities.PREFS_LOGGING_DELETE)) {
					onDeleteLogFiles(getActivity());
				}
				return false;
			}
			
		};
		getPreferenceManager().findPreference(Utilities.PREFS_LOGGING_DELETE).setOnPreferenceClickListener(clickListener);
    }
    
    private void onDeleteLogFiles(Activity activity) {
    	File dir = new File(INTERNAL_STORAGE_DIR);
    	
    	(new File(dir, LOG_FILE)).delete();
    	(new File(dir, LOG_FILE_DEBUG)).delete();
    	(new File(dir, LOG_FILE_ERROR)).delete();
    	(new File(dir, LOG_FILE_TAINTMAP)).delete();
    	(new File(dir, LOG_FILE_JAVA)).delete();
    	
    	Toast.makeText(activity, "All log files have been deleted", Toast.LENGTH_LONG).show();
    }
}
