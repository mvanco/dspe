package cz.vutbr.policyenforcement.demo.filemanager.lists;

import java.util.ArrayList;

import cz.vutbr.policyenforcement.demo.filemanager.R;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.Toast;
import cz.vutbr.policyenforcement.demo.filemanager.files.FileHolder;
import cz.vutbr.policyenforcement.demo.filemanager.util.MenuUtils;
import cz.vutbr.policyenforcement.demo.filemanager.view.LegacyActionContainer;

/**
 * Dedicated file list fragment, used for multiple selection on platforms older than Honeycomb.
 * OnDestroy sets RESULT_OK on the parent activity so that callers refresh their lists if appropriate.
 * @author George Venios
 */
public class MultiselectListFragment extends FileListFragment {
	private LegacyActionContainer mLegacyActionContainer;
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {		
		return inflater.inflate(R.layout.filelist_legacy_multiselect, null);
	}
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);			
		setHasOptionsMenu(true);
	}
	
	@Override
	public void onViewCreated(View view, Bundle savedInstanceState) {
		getListView().setChoiceMode(ListView.CHOICE_MODE_MULTIPLE);
		
		super.onViewCreated(view, savedInstanceState);
		
		mAdapter.setItemLayout(R.layout.item_filelist_multiselect);
		
		// Init members
		mLegacyActionContainer =  (LegacyActionContainer) view.findViewById(R.id.action_container);
		mLegacyActionContainer.setMenuResource(R.menu.multiselect);
		mLegacyActionContainer.setOnActionSelectedListener(new LegacyActionContainer.OnActionSelectedListener() {
			@Override
			public void actionSelected(MenuItem item) {
				if(getListView().getCheckItemIds().length == 0){
					Toast.makeText(getActivity(), R.string.no_selection, Toast.LENGTH_SHORT).show();
					return;
				}
				
				ArrayList<FileHolder> fItems = new ArrayList<FileHolder>();
				
				for(long i : getListView().getCheckItemIds()){
					fItems.add((FileHolder) mAdapter.getItem((int) i));
				}
				
				MenuUtils.handleMultipleSelectionAction(MultiselectListFragment.this, item, fItems, getActivity());
			}
		});
	}
	
	@Override
	public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
		inflater.inflate(R.menu.options_multiselect, menu);
	}
	
	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		ListView list = getListView();
		
		int itemId = item.getItemId();
		if (itemId == R.id.check_all) {
			for(int i = 0; i < mAdapter.getCount(); i++){
				list.setItemChecked(i, true);
			}
			return true;
		} else if (itemId == R.id.uncheck_all) {
			for(int i = 0; i < mAdapter.getCount(); i++){
				list.setItemChecked(i, false);
			}
			return true;
		} else {
			return false;
		}
	}
}