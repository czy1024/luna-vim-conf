w = nodeRequire('electron')
   .remote
   .getCurrentWindow();

w.setBackgroundColor('#00000000');
// 设置半透明效果  https://electronjs.org/docs/api/browser-window#winsetvibrancytype-macos 
w.setVibrancy('ultra-dark');

// hack https://github.com/microsoft/vscode/issues/32257#issuecomment-509936623
const width = w.getBounds().width;
w.setBounds({
    width: width + 1,
});
w.setBounds({
    width,
});
