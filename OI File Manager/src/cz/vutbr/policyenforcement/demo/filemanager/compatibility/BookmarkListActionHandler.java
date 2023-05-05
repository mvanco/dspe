package cz.vutbr.policyenforcement.demo.filemanager.compatibility;

import cz.vutbr.policyenforcement.demo.filemanager.R;

import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.view.MenuItem;
import android.widget.ListView;
import android.widget.AdapterView.AdapterContextMenuInfo;
import cz.vutbr.policyenforcement.demo.filemanager.bookmarks.BookmarkListAdapter;
import cz.vutbr.policyenforcement.demo.filemanager.bookmarks.BookmarksProvider;

public class BookmarkListActionHandler {
	/**
	 * Offers a centralized bookmark action execution component.
	 * 
	 * @param item
	 *            The MenuItem selected.
	 * @param list
	 *            The list to act upon.
	 *            
	 * @param pos The selected item's position.
	 */
	public static void handleItemSelection(MenuItem item, ListView list) {
		
		// Single selection
		if (VERSION.SDK_INT < VERSION_CODES.HONEYCOMB
				|| ListViewMethodHelper.listView_getCheckedItemCount(list) == 1) {

			// Get id of selected bookmark.
			long id = -1;
			if(item.getMenuInfo() instanceof AdapterContextMenuInfo)
				id = list.getAdapter().getItemId(((AdapterContextMenuInfo) item.getMenuInfo()).position);
			if (VERSION.SDK_INT > VERSION_CODES.HONEYCOMB)
				id = ListViewMethodHelper.listView_getCheckedItemIds(list)[0];
			
			int itemId = item.getItemId();
			if (itemId == R.id.menu_delete) {
				list.getContext().getContentResolver().delete(BookmarksProvider.CONTENT_URI, BookmarksProvider._ID + "=?", new String[] {""+id});
			}
		} else {
			int itemId = item.getItemId();
			if (itemId == R.id.menu_delete) {
				long[] ids = ListViewMethodHelper.listView_getCheckedItemIds(list);
				for(int i=0; i<ids.length; i++){
					list.getContext().getContentResolver().delete(BookmarksProvider.CONTENT_URI, BookmarksProvider._ID + "=?", new String[] {""+ids[i]});
				}
			}
		}
		
		((BookmarkListAdapter)list.getAdapter()).notifyDataSetChanged();
	}
}