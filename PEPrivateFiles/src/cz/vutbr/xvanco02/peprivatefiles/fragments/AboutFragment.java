package cz.vutbr.xvanco02.peprivatefiles.fragments;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import cz.vutbr.xvanco02.peprivatefiles.MainActivity;
import cz.vutbr.xvanco02.peprivatefiles.R;

/**
 * A placeholder fragment containing a simple view.
 */
public class AboutFragment extends Fragment {
	/**
	 * The fragment argument representing the section number for this
	 * fragment.
	 */
	private static final String ARG_SECTION_NUMBER = "section_number";	

	/**
	 * Returns a new instance of this fragment for the given section number.
	 */
	public static AboutFragment newInstance() {
		AboutFragment fragment = new AboutFragment();
		Bundle args = new Bundle();
		fragment.setArguments(args);
		return fragment;
	}

	public AboutFragment() {
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
		View rootView = inflater.inflate(R.layout.about, container, false);
		return rootView;
	}

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		((MainActivity) activity).onSectionAttached(getArguments().getInt(ARG_SECTION_NUMBER));
	}
}
