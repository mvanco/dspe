package cz.vutbr.policyenforcement.demo.filemanager.dialogs;

import java.io.File;

import cz.vutbr.policyenforcement.demo.filemanager.R;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import cz.vutbr.policyenforcement.demo.filemanager.dialogs.OverwriteFileDialog.Overwritable;
import cz.vutbr.policyenforcement.demo.filemanager.files.FileHolder;
import cz.vutbr.policyenforcement.demo.filemanager.lists.FileListFragment;
import cz.vutbr.policyenforcement.demo.filemanager.util.CompressManager;
import cz.vutbr.policyenforcement.demo.filemanager.util.MediaScannerUtils;
import cz.vutbr.policyenforcement.demo.intents.FileManagerIntents;

public class SingleCompressDialog extends DialogFragment implements Overwritable {
	private FileHolder mFileHolder;
	private CompressManager mCompressManager;
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		mFileHolder = getArguments().getParcelable(FileManagerIntents.EXTRA_DIALOG_FILE_HOLDER);
		
		mCompressManager = new CompressManager(getActivity());
		mCompressManager.setOnCompressFinishedListener(new CompressManager.OnCompressFinishedListener() {
			
			@Override
			public void compressFinished() {
				((FileListFragment) SingleCompressDialog.this.getTargetFragment()).refresh();

				MediaScannerUtils.informFileAdded(getTargetFragment().getActivity().getApplicationContext(), tbcreated);
			}
		});
	}
	
	@Override
	public Dialog onCreateDialog(Bundle savedInstanceState) {
		LayoutInflater inflater = LayoutInflater.from(getActivity());
		LinearLayout view = (LinearLayout) inflater.inflate(R.layout.dialog_text_input, null);
		final EditText v = (EditText) view.findViewById(R.id.foldername);
		v.setHint(R.string.compressed_file_name);
		
		v.setOnEditorActionListener(new TextView.OnEditorActionListener(){
			public boolean onEditorAction(TextView text, int actionId, KeyEvent event) {
				   if (actionId == EditorInfo.IME_ACTION_GO)
					   compress(v.getText().toString());
				   dismiss();
				   return true;
				}
		});
		
		return new AlertDialog.Builder(getActivity())
				.setTitle(R.string.menu_compress)
				.setView(view)
				.setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() {
					public void onClick(DialogInterface dialog, int which) {
						compress(v.getText().toString());
					}
				}).setNegativeButton(android.R.string.cancel, null).create();
	}
	
	private void compress(final String zipname){
		tbcreated = new File(mFileHolder.getFile().getParent() + File.separator + zipname + ".zip");
		if (tbcreated.exists()) {
			this.zipname = zipname;
			OverwriteFileDialog dialog = new OverwriteFileDialog();
			dialog.setTargetFragment(this, 0);
			dialog.show(getFragmentManager(), "OverwriteFileDialog");
		} else {
			mCompressManager.compress(mFileHolder, tbcreated.getName());
		}
	}

	private File tbcreated;
	private String zipname;
	
	@Override
	public void overwrite() {
		tbcreated.delete();
		compress(zipname);
	}
}