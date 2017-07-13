// Please see http://facebook.github.io/react-native/docs/toastandroid.html for more documentation
import { NativeModules, ToastAndroid, Platform } from 'react-native';
const { MerryToast } = NativeModules;
// android defaults to ToastAndroid
const Toast = Platform.OS === 'android' ? ToastAndroid : MerryToast;
// not support windows yet
export default {
    // Toast duration constants
    SHORT: Toast.SHORT,
    LONG: Toast.LONG,
    // Toast gravity constants
    TOP: Toast.TOP,
    BOTTOM: Toast.BOTTOM,
    CENTER: Toast.CENTER,
    /**
     * @param {string} message A string with the text to toast
     * @param {number} duration The duration of the toast. May be Toast.SHORT or Toast.LONG
     */
    show: function (message, duration) {
        Toast.show(message, (duration = this.SHORT));
    },
    /**
     * `gravity` may be ToastAndroid.TOP, ToastAndroid.BOTTOM, ToastAndroid.CENTER
     * @param {string} message A string with the text to toast
     * @param {number} duration The duration of the toast. May be Toast.SHORT or Toast.LONG
     * @param {number} gravity Specify the layout gravity. May be Toast.TOP or Toast.BOTTOM or Toast.CENTER
     */
    showWithGravity: function (message, duration, gravity) {
        Toast.showWithGravity(message, (duration = this.SHORT), gravity);
    },
};
