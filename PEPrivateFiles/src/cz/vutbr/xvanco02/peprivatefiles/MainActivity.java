package cz.vutbr.xvanco02.peprivatefiles;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarActivity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import cz.vutbr.xvanco02.peprivatefiles.fragments.AboutFragment;
import cz.vutbr.xvanco02.peprivatefiles.fragments.ConfigurationFragment;
import cz.vutbr.xvanco02.peprivatefiles.fragments.PrivateFilesFragment;

public class MainActivity extends ActionBarActivity implements NavigationDrawerFragment.NavigationDrawerCallbacks, NavigationDrawerFragment.SelectedFileCallback {
	
	private static final int NAV_SELECT_FILES = 0;
	private static final int NAV_CONFIGURATION = 1;
	private static final int NAV_ABOUT = 2;
	private static final String TAG_SELECT_FILES = "TAG_SELECT_FILES";
	private static final String TAG_CONFIGURATION = "TAG_CONFIGURATION";
	private static final String TAG_ABOUT = "TAG_ABOUT";

	/**
	 * Fragment managing the behaviors, interactions and presentation of the
	 * navigation drawer.
	 */
	private NavigationDrawerFragment mNavigationDrawerFragment;

	/**
	 * Used to store the last screen title. For use in
	 * {@link #restoreActionBar()}.
	 */
	private CharSequence mTitle;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		mNavigationDrawerFragment = (NavigationDrawerFragment) getSupportFragmentManager()
				.findFragmentById(R.id.navigation_drawer);
		mTitle = getTitle();

		// Set up the drawer.
		mNavigationDrawerFragment.setUp(R.id.navigation_drawer, (DrawerLayout) findViewById(R.id.drawer_layout));
	}
	
	@Override
	public void onNavigationDrawerItemSelected(int position) {
		
		FragmentManager fragmentManager = getSupportFragmentManager();
		
		if (position == NAV_SELECT_FILES) {
			fragmentManager.beginTransaction().replace(R.id.container, PrivateFilesFragment.newInstance(), TAG_SELECT_FILES).commit();
		}
		else if (position == NAV_CONFIGURATION) {
			fragmentManager.beginTransaction().replace(R.id.container, ConfigurationFragment.newInstance(), TAG_CONFIGURATION).commit();
		}
		else if (position == NAV_ABOUT) {
			fragmentManager.beginTransaction().replace(R.id.container, AboutFragment.newInstance(), TAG_ABOUT).commit();
		}
	}
	
	@Override
	public void onPathSelected(String path) {
		getSupportFragmentManager().executePendingTransactions();
		PrivateFilesFragment privateFilesFrag = (PrivateFilesFragment) getSupportFragmentManager().findFragmentByTag(TAG_SELECT_FILES);
		if (privateFilesFrag != null) {
			privateFilesFrag.addPath(path);
		}
	}
	
	

	public void onSectionAttached(int number) {
		switch (number) {
		case 1:
			mTitle = getString(R.string.title_section1);
			break;
		case 2:
			mTitle = getString(R.string.title_section2);
			break;
		case 3:
			mTitle = getString(R.string.title_section3);
			break;
		}
	}

	public void restoreActionBar() {
		ActionBar actionBar = getSupportActionBar();
		actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_STANDARD);
		actionBar.setDisplayShowTitleEnabled(true);
		actionBar.setTitle(mTitle);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		if (!mNavigationDrawerFragment.isDrawerOpen()) {
			// Only show items in the action bar relevant to this screen
			// if the drawer is not showing. Otherwise, let the drawer
			// decide what to show in the action bar.
			getMenuInflater().inflate(R.menu.main, menu);
			restoreActionBar();
			return true;
		}
		return super.onCreateOptionsMenu(menu);
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		int id = item.getItemId();
		if (id == R.id.action_quit) {
			finish();
            System.exit(0);
			return true;
		}
		return super.onOptionsItemSelected(item);
	}

	/**
	 * A placeholder fragment containing a simple view.
	 */
	public static class PlaceholderFragment extends Fragment {
		/**
		 * The fragment argument representing the section number for this
		 * fragment.
		 */
		private static final String ARG_SECTION_NUMBER = "section_number";

		/**
		 * Returns a new instance of this fragment for the given section number.
		 */
		public static PlaceholderFragment newInstance(int sectionNumber) {
			PlaceholderFragment fragment = new PlaceholderFragment();
			Bundle args = new Bundle();
			args.putInt(ARG_SECTION_NUMBER, sectionNumber);
			fragment.setArguments(args);
			return fragment;
		}

		public PlaceholderFragment() {
		}

		@Override
		public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
			View rootView = inflater.inflate(R.layout.fragment_main, container, false);
			return rootView;
		}

		@Override
		public void onAttach(Activity activity) {
			super.onAttach(activity);
			((MainActivity) activity).onSectionAttached(getArguments().getInt(ARG_SECTION_NUMBER));
		}
	}
}
