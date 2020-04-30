<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v6.0&appId=253033765735907&autoLogAppEvents=1"></script>
<script>
window.fbAsyncInit = function() {
  FB.init({
    appId      : '{253033765735907}',
    cookie     : true,
    xfbml      : true,
    version    : '{api-version}'
  });
    
  FB.AppEvents.logPageView();   
    
};

(function(d, s, id){
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement(s); js.id = id;
   js.src = "https://connect.facebook.net/en_US/sdk.js";
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'));
</script>


took out protect from forgery from AppController 

layouts/background 
  body {
 background-image: url("https://lh3.googleusercontent.com/proxy/mnCL25XDfO1MYQt4AiYjWE3ku_w-Jqi6KlQaU-Ot7kWZjBrgQatpS8Zl39rcmYc3iIaE2Z4kUAfv9lfdn5eax9MkrmeKIF-ZNyuYNMv9FkpHyoZeyPSljadqtwVYjyitPSU69P7NumSXm5vW68CJTNPADYEeJ9zLHkCfpjFded1IZ1PpetfIk4ahsCXgzw");
 background-color: #cccccc;
}

elsif 
           @user = User.find_by(params[:user_id]) 
          @teams = @user.teams 