let config = {
  base: '',
  fileServer: ''
};

let [tokenKey] = ['login_token'];

let store = {
  setLoginToken: token => localStorage.setItem(tokenKey, token),
  getLoginToken: () => localStorage.getItem(tokenKey),
  removeLoginToken: () => localStorage.removeItem(tokenKey)
};
