$(document).ready(function(){


     $(window).resize(function(){

      console.log(window.innerHeight * window.innerWidth)
     })

    OverCreate = function (o){
      /* ====== init variables ===== */

      /*=======cutepageshow+floor+overshow=======*/

      /*========cutepage===========*/

      CutePageShow = document.createElement("div");
      document.body.appendChild(CutePageShow);
      CutePageShow.id = "cute_page_show";
      $("#cute_page_show").css({
        "position" : "fixed",
        "top" : "0",
        "left" : "0",
        "right" : "0",
        "bottom": "0",
        "overflow-x" : "hidden",

        "overflow-y" :"hidden",
        "z-index" : "2",
        "background-color" : "rgba(15, 15, 15, 0.949219)",
        "backgroundImage":"url(./over.png)"

      });

      /*======floor==============*/

      Floor = document.createElement("div");
      CutePageShow.appendChild(Floor);
      Floor.id = "floor";
      page_h = window.innerHeight;
      page_w = window.innerWidth;
      $("#floor").css({
        "width" : page_w,
        "height" : page_h,
        "position" : "absolute",
        "top" : "0",
        "left" : "0",
        "right" : "0",
        "bottom": "0",
        "z-index" : "2"
                      })
      $("#floor").click(function(){

        document.body.parentNode.style.overflow="scroll"; //浏览器滚动显示且可用
        document.body.removeChild(CutePageShow);
        // console.log(window.innerHeight)
      })
      /*=======overshow==============*/
      OverShow = document.createElement("img");

      OverShow.id = "showeffect"
      OverShow.src = o.src;

      CutePageShow.appendChild(OverShow);

      document.body.parentNode.style.overflow="hidden";//浏览器滚动不显示且不可用





      w_origin = OverShow.width;
      h_origin = OverShow.height;


      zoomClick = 1.3;
      window_area = window.innerHeight * window.innerWidth;
      pic_true_area = w_origin * h_origin;


      /*before the locate test the size of window and pic*/
      if ( window_area > pic_true_area){

      }

      l_target =( window.innerWidth - w_origin )/2;
      t_target = (window.innerHeight - h_origin )/2;

      $("#showeffect").css({
        "width" : w_origin ,
        "height" : h_origin,
        "position" : "absolute",
        "opacity" : ".8",
        "z-index" : "22222222222",
        "left" : l_target ,
        "top" : t_target,
          })
        };
    $(".photo_effect").click(function(){

        OverCreate(this.children[0]);
    })

})