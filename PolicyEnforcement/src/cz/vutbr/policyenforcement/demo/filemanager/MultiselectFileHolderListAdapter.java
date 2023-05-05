package cz.vutbr.policyenforcement.demo.filemanager;

import java.util.List;

import cz.vutbr.policyenforcement.demo.filemanager.R;

import android.content.Context;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import cz.vutbr.policyenforcement.demo.filemanager.files.FileHolder;
import cz.vutbr.policyenforcement.demo.filemanager.view.CheckableFileListItem;
import cz.vutbr.policyenforcement.demo.filemanager.view.ViewHolder;

/**
 * Extension of {@link FileHolderListAdapter} that displays checkable items.
 * @author George Venios.
 */
public class MultiselectFileHolderListAdapter extends FileHolderListAdapter{
	public MultiselectFileHolderListAdapter(List<FileHolder> files, Context c) {
		super(files, c);
	}
	
	@Override
	protected View newView() {
		View view = new CheckableFileListItem(getContext());

		ViewHolder holder = new ViewHolder();
		holder.icon = (ImageView) view.findViewById(R.id.icon);
		holder.primaryInfo = (TextView) view.findViewById(R.id.primary_info);
		holder.secondaryInfo = (TextView) view.findViewById(R.id.secondary_info);
		holder.tertiaryInfo = (TextView) view.findViewById(R.id.tertiary_info);

		view.setTag(holder);
		return view;
	}
}