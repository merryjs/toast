import { NativeModules, ToastAndroid, Platform } from 'react-native'

const { MerryToast } = NativeModules
const Toast: ToastAndroid =
  Platform.OS === 'android' ? ToastAndroid : MerryToast

export default {
  // Toast duration constants
  SHORT: Toast.SHORT,
  LONG: Toast.LONG,

  // Toast gravity constants
  TOP: Toast.TOP,
  BOTTOM: Toast.BOTTOM,
  CENTER: Toast.CENTER,
}
