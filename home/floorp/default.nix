{
  programs.floorp.enable = true;
  home.file.".floorp/ckzj5en6.default/chrome/userChrome.css" = {
    text = ''
      @charset "UTF-8";
      @-moz-document url(chrome://browser/content/browser.xhtml) {
	/* Please write your custom CSS under this line*/
      }
    '';
    recursive = true;
    force = true;
  };
}
