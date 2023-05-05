package cz.vutbr.policyenforcement.demo.filemanager.util;

import cz.vutbr.policyenforcement.demo.filemanager.R;

import android.app.Activity;
import android.preference.PreferenceManager;

public abstract class UIUtils {

	public static void setThemeFor(Activity act) {
		if (PreferenceManager.getDefaultSharedPreferences(act).getBoolean("usedarktheme", true)) {
			act.setTheme(R.style.Theme_Dark);
		} else {
			act.setTheme(R.style.Theme_Light_DarkTitle);
		}
	}
	
	public static boolean shouldDialogInverseBackground(Activity act){
		return !PreferenceManager.getDefaultSharedPreferences(act).getBoolean("usedarktheme", true);
	}
}
