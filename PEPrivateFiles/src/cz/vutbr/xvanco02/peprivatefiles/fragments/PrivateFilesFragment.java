package cz.vutbr.xvanco02.peprivatefiles.fragments;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.SimpleAdapter;
import android.widget.Toast;
import cz.vutbr.xvanco02.filedialog.FileDialog;
import cz.vutbr.xvanco02.peprivatefiles.MainActivity;
import cz.vutbr.xvanco02.peprivatefiles.NavigationDrawerFragment;
import cz.vutbr.xvanco02.peprivatefiles.R;
import cz.vutbr.xvanco02.peprivatefiles.Utilities;

/**
 * A placeholder fragment containing a simple view.
 */
public class PrivateFilesFragment extends ListFragment {
	/**
	 * The fragment argument representing the section number for this
	 * fragment.
	 */
	private static final String ARG_SECTION_NUMBER = "section_number";
	
	List<Map<String, String>> data = new ArrayList<Map<String, String>>();
	
	SimpleAdapter adapter = null;
	
	LayoutInflater inflater;


	/**
	 * Returns a new instance of this fragment for the given section number.
	 */
	public static PrivateFilesFragment newInstance() {
		PrivateFilesFragment fragment = new PrivateFilesFragment();
		Bundle args = new Bundle();
		fragment.setArguments(args);
		return fragment;
	}

	public PrivateFilesFragment() {
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
		View rootView = inflater.inflate(R.layout.private_files, container, false);
		
		LinearLayout emptyView = (LinearLayout) rootView.findViewById(android.R.id.empty);
		emptyView.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				NavigationDrawerFragment.startDialogActivity(getActivity());
			}
			
		});
		
		Button deleteButton = (Button) rootView.findViewById(R.id.private_files_add_button);
		deleteButton.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				onDeleteButtonClick(v);
			}
			
		});		
		
		//Utilities.makeSnapshotConf(getActivity());
		
		return rootView;
	}
	
	public void onDeleteButtonClick(View v) {
		new AlertDialog.Builder(getActivity())
		.setTitle("Delete All")
		.setMessage("Do you really want to stop protecting all these files?")
		.setIcon(android.R.drawable.ic_dialog_alert)
		.setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {

		    public void onClick(DialogInterface dialog, int whichButton) {
		        data.clear();
		        adapter.notifyDataSetChanged();
		        try {
					Utilities.saveToFile(getActivity(), data);
				} catch (IOException e) {
					Toast.makeText(getActivity(), getString(R.string.private_files_toast_cannot), Toast.LENGTH_LONG).show();
				}
		    }})
		 .setNegativeButton(android.R.string.no, null).show();
	}
	
	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		super.onActivityCreated(savedInstanceState);
		
		Utilities.loadFromFile(getActivity(), data);
		
		String[] from = { "icon", "path" };
		int[] to = { R.id.image, R.id.path };
		adapter = new SimpleAdapter(getActivity(), data, R.layout.private_files_row, from, to);

		View header = inflater.inflate(R.layout.private_files_header, null);
		getListView().addHeaderView(header);
		
		setListAdapter(adapter);
		
		
	    registerForContextMenu(getListView());
	}
	
	@Override
	public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo) {
		menu.add(Menu.NONE, 1, Menu.NONE, "Delete");
	}
	
	
	@Override
	public boolean onContextItemSelected(MenuItem item) {
		final AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
		switch (item.getItemId()) {
		case 1:
			deletePath(info.position - 1); //position is indexed from 1, array from 0
			break;
		}
		return (super.onContextItemSelected(item));
	}
	
	private void deletePath(int id) {
		data.remove(id);
		adapter.notifyDataSetChanged();
		
		try {
			Utilities.saveToFile(getActivity(), data);
			Toast.makeText(getActivity(), getString(R.string.private_files_toast_saved), Toast.LENGTH_LONG).show();
		} catch (IOException e) {
			Toast.makeText(getActivity(), getString(R.string.private_files_toast_cannot), Toast.LENGTH_LONG).show();
		}
	}
	

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		((MainActivity) activity).onSectionAttached(getArguments().getInt(ARG_SECTION_NUMBER));
		inflater = LayoutInflater.from(activity);
	}
	
	public void addPath(String path) {
		if (containsPath(path)) {
			Toast.makeText(getActivity(), getString(R.string.private_files_toast_duplicate), Toast.LENGTH_LONG).show();
			return;
		}
		
		Map<String, String> data_row = new HashMap<String, String>();
		data_row.put("path", path);
		
		int imageID;
		if ( (new File(path)).isFile() ) {
			imageID = R.drawable.file;
		}
		else {
			imageID = R.drawable.folder;
		}
		data_row.put("icon", Integer.toString(imageID));
		
		data.add(data_row);
		adapter.notifyDataSetChanged();
		
		try {
			Utilities.saveToFile(getActivity(), data);
			Toast.makeText(getActivity(), getString(R.string.private_files_toast_saved), Toast.LENGTH_LONG).show();
		} catch (IOException e) {
			Toast.makeText(getActivity(), getString(R.string.private_files_toast_cannot), Toast.LENGTH_LONG).show();
		}
	}
	
	private boolean containsPath(String path) {
		for (Map<String, String> map : data) {
			String comparedPath = map.get("path");
			if (comparedPath.equals(path)) {
				return true;
			}
		}
		
		return false;
	}
}
