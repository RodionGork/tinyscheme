Module['print'] = function(text) {
  doOutput(text + '\r\n');
};
Module['onRuntimeInitialized'] = function() {
  onStartup()
};

