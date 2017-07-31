package com.caobaohe.cordova.opennative;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
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

	private static final String TAG = "OpenNative";

	public OpenNative() {
	}

	@Override
	public boolean execute(String action, JSONArray args,
			CallbackContext callbackContext) throws JSONException {
		// return super.execute(action, args, callbackContext);
		if ("open".equals(action)) {
			this.open(args.getString(0));
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
		// android.provider.Settings.ACTION_LOCATION_SOURCE_SETTINGS // 打开系统设置界面
		this.cordova.getActivity().startActivity(intent);
	}
}
