package com.caobaohe.cordova.opennative;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.LOG;
import org.json.JSONArray;
import org.json.JSONException;

import android.content.Intent;

/**
 * cordova 自定义插件打开android系统原生应用
 *
 * @author caobaohe
 *
 */
public class OpenNative extends CordovaPlugin {

	private static final String LOG_TAG = "OpenNative";

	public OpenNative() {
	}

	@Override
	public boolean execute(String action, JSONArray args,
						   CallbackContext callbackContext) throws JSONException {
		// return super.execute(action, args, callbackContext);
		if ("open".equals(action)) {
			String intent = args.getString(0);
			LOG.d(LOG_TAG, "OpenNative:" + intent);
			if (intent != null && !intent.equals("")) {
				if ("setting_service".equals(intent)) {
					this.open(android.provider.Settings.ACTION_SETTINGS);
				} else if ("location_service".equals(intent)) {
					this.open(android.provider.Settings.ACTION_LOCATION_SOURCE_SETTINGS);
				} else if ("bluetooth_service".equals(intent)) {
					this.open(android.provider.Settings.ACTION_BLUETOOTH_SETTINGS);
				} else if ("date_service".equals(intent)) {
					this.open(android.provider.Settings.ACTION_DATE_SETTINGS);
				} else if ("sound_service".equals(intent)) {
					this.open(android.provider.Settings.ACTION_SOUND_SETTINGS);
				}
			}
		} else {
			return false;
		}
		return true;
	}

	/**
	 * 打开一个activity
	 */
	private void open(String action) {
		Intent intent = new Intent(action);
		this.cordova.getActivity().startActivity(intent);
	}
}
