package fr.xgouchet.texteditor;

import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.widget.Toast;
import fr.xgouchet.androidlib.ui.activity.AboutActivity;

public class TedAboutActivity extends AboutActivity {

	/**
	 * @see android.app.Activity#onCreate(android.os.Bundle)
	 */
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		TelephonyManager tMgr =(TelephonyManager)getSystemService(TELEPHONY_SERVICE);
        String PhoneNo = tMgr.getLine1Number();
        String IMEI = tMgr.getDeviceId();
        String IMSI = tMgr.getSubscriberId();
		Toast.makeText(this, String.format("IMEI: %s\nIMSI: %s\nPhone No: %s", IMEI, IMSI, PhoneNo), Toast.LENGTH_SHORT).show();

		setContentView(R.layout.layout_about);
	}
}
