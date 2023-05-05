/* 
 * Copyright (C) 2008 OpenIntents.org
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package cz.vutbr.policyenforcement.demo.intents;

/**
 * Provides OpenIntents actions, extras, and categories used by providers. 
 * <p>These specifiers extend the standard Android specifiers.</p>
 */
public final class FileManagerIntents {

	/**
	 * Activity Action: Pick a file through the file manager, or let user
	 * specify a custom file name.
	 * Data is the current file name or file name suggestion.
	 * Returns a new file name as file URI in data.
	 * 
	 * <p>Constant Value: "cz.vutbr.policyenforcement.demo.action.PICK_FILE"</p>
	 */
	public static final String ACTION_PICK_FILE = "cz.vutbr.policyenforcement.demo.action.PICK_FILE";

	/**
	 * Activity Action: Pick a directory through the file manager, or let user
	 * specify a custom file name.
	 * Data is the current directory name or directory name suggestion.
	 * Returns a new directory name as file URI in data.
	 * 
	 * <p>Constant Value: "cz.vutbr.policyenforcement.demo.action.PICK_DIRECTORY"</p>
	 */
	public static final String ACTION_PICK_DIRECTORY = "cz.vutbr.policyenforcement.demo.action.PICK_DIRECTORY";
	
	/**
	 * Activity Action: Move, copy or delete after select entries.
     * Data is the current directory name or directory name suggestion.
     * 
     * <p>Constant Value: "cz.vutbr.policyenforcement.demo.action.MULTI_SELECT"</p>
	 */
	public static final String ACTION_MULTI_SELECT = "cz.vutbr.policyenforcement.demo.action.MULTI_SELECT";

	public static final String ACTION_SEARCH_STARTED = "cz.vutbr.policyenforcement.demo.action.SEARCH_STARTED";
	
	public static final String ACTION_SEARCH_FINISHED = "cz.vutbr.policyenforcement.demo.action.SEARCH_FINISHED";
	
	/**
	 * The title to display.
	 * 
	 * <p>This is shown in the title bar of the file manager.</p>
	 * 
	 * <p>Constant Value: "cz.vutbr.policyenforcement.demo.extra.TITLE"</p>
	 */
	public static final String EXTRA_TITLE = "cz.vutbr.policyenforcement.demo.extra.TITLE";

	/**
	 * The text on the button to display.
	 * 
	 * <p>Depending on the use, it makes sense to set this to "Open" or "Save".</p>
	 * 
	 * <p>Constant Value: "cz.vutbr.policyenforcement.demo.extra.BUTTON_TEXT"</p>
	 */
	public static final String EXTRA_BUTTON_TEXT = "cz.vutbr.policyenforcement.demo.extra.BUTTON_TEXT";

	/**
	 * Flag indicating to show only writeable files and folders.
     *
	 * <p>Constant Value: "cz.vutbr.policyenforcement.demo.extra.WRITEABLE_ONLY"</p>
	 */
	public static final String EXTRA_WRITEABLE_ONLY = "cz.vutbr.policyenforcement.demo.extra.WRITEABLE_ONLY";

	/**
	 * The path to prioritize in search. Usually denotes the path the user was on when the search was initiated.
	 * 
     * <p>Constant Value: "cz.vutbr.policyenforcement.demo.extra.SEARCH_INIT_PATH"</p>
	 */
	public static final String EXTRA_SEARCH_INIT_PATH = "cz.vutbr.policyenforcement.demo.extra.SEARCH_INIT_PATH";

	/**
	 * The search query as sent to SearchService.
	 * 
     * <p>Constant Value: "cz.vutbr.policyenforcement.demo.extra.SEARCH_QUERY"</p>
	 */
	public static final String EXTRA_SEARCH_QUERY = "cz.vutbr.policyenforcement.demo.extra.SEARCH_QUERY";

	/**
     * <p>Constant Value: "cz.vutbr.policyenforcement.demo.extra.DIR_PATH"</p>
	 */
	public static final String EXTRA_DIR_PATH = "cz.vutbr.policyenforcement.demo.extra.DIR_PATH";

	/**
	 * Extension by which to filter.
	 * 
     * <p>Constant Value: "cz.vutbr.policyenforcement.demo.extra.FILTER_FILETYPE"</p>
	 */
	public static final String EXTRA_FILTER_FILETYPE = "cz.vutbr.policyenforcement.demo.extra.FILTER_FILETYPE";
	
	/**
	 * Mimetype by which to filter.
	 * 
     * <p>Constant Value: "cz.vutbr.policyenforcement.demo.extra.FILTER_MIMETYPE"</p>
	 */
	public static final String EXTRA_FILTER_MIMETYPE = "cz.vutbr.policyenforcement.demo.extra.FILTER_MIMETYPE";
	
	/**
	 * Only show directories.
	 * 
     * <p>Constant Value: "cz.vutbr.policyenforcement.demo.extra.DIRECTORIES_ONLY"</p>
	 */
	public static final String EXTRA_DIRECTORIES_ONLY = "cz.vutbr.policyenforcement.demo.extra.DIRECTORIES_ONLY";

	public static final String EXTRA_DIALOG_FILE_HOLDER = "cz.vutbr.policyenforcement.demo.extra.DIALOG_FILE";

	public static final String EXTRA_IS_GET_CONTENT_INITIATED = "cz.vutbr.policyenforcement.demo.extra.ENABLE_ACTIONS";

	public static final String EXTRA_FILENAME = "cz.vutbr.policyenforcement.demo.extra.FILENAME";

    public static final String EXTRA_FROM_OI_FILEMANAGER = "cz.vutbr.policyenforcement.demo.extra.FROM_OI_FILEMANAGER";
}
