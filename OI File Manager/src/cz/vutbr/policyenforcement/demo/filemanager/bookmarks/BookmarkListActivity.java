package cz.vutbr.policyenforcement.demo.filemanager.bookmarks;

import cz.vutbr.policyenforcement.demo.filemanager.R;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.MenuItem;
import cz.vutbr.policyenforcement.demo.filemanager.compatibility.HomeIconHelper;
import cz.vutbr.policyenforcement.demo.filemanager.util.UIUtils;

public class BookmarkListActivity extends FragmentActivity {
	private static final String FRAGMENT_TAG = "Fragment";
	
	public static String KEY_RESULT_PATH = "path";
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		UIUtils.setThemeFor(this);
		super.onCreate(savedInstanceState);				
			 
		if(Build.VERSION.SDK_INT > Build.VERSION_CODES.HONEYCOMB){
			HomeIconHelper.activity_actionbar_setDisplayHomeAsUpEnabled(this);
		}
		
		if(getSupportFragmentManager().findFragmentByTag(FRAGMENT_TAG) == null)
			getSupportFragmentManager().beginTransaction().add(android.R.id.content, new BookmarkListFragment(), FRAGMENT_TAG).commit();
	}

	public void onListItemClick(String path) {
		setResult(RESULT_OK, new Intent().putExtra(KEY_RESULT_PATH, path));
		finish();
	}
	
	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch(item.getItemId()){
		case android.R.id.home:
			HomeIconHelper.showHome(this);
			break;
		}
		return super.onOptionsItemSelected(item);
	}
}