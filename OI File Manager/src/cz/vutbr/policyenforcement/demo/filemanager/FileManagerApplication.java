package cz.vutbr.policyenforcement.demo.filemanager;

import android.app.Application;
import cz.vutbr.policyenforcement.demo.filemanager.util.CopyHelper;

public class FileManagerApplication extends Application{
	private CopyHelper mCopyHelper;
	
	@Override
	public void onCreate() {
		super.onCreate();
		
		mCopyHelper = new CopyHelper(this);
	}
	
	public CopyHelper getCopyHelper(){
		return mCopyHelper;
	}
}