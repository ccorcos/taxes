
boxSizing = (x) ->
	WebkitBoxSizing: x
	MozBoxSizing: x
	boxSizing: x

userSelect = (x) ->
	WebkitUserSelect: x
	MozUserSelect: x
	MsUserSelect: x
	userSelect: x


#
#
# .box-shadow (@string) {
# 	-webkit-box-shadow: @string;
# 	-moz-box-shadow:    @string;
# 	box-shadow:         @string;
# }
# .drop-shadow (@x: 0, @y: 1px, @blur: 2px, @spread: 0, @alpha: 0.25) {
# 	-webkit-box-shadow:	@x @y @blur @spread rgba(0, 0, 0, @alpha);
# 	-moz-box-shadow:	@x @y @blur @spread rgba(0, 0, 0, @alpha);
# 	box-shadow:		@x @y @blur @spread rgba(0, 0, 0, @alpha);
# }
# .inner-shadow (@x: 0, @y: 1px, @blur: 2px, @spread: 0, @alpha: 0.25) {
# 	-webkit-box-shadow: inset @x @y @blur @spread rgba(0, 0, 0, @alpha);
# 	-moz-box-shadow:    inset @x @y @blur @spread rgba(0, 0, 0, @alpha);
# 	box-shadow:         inset @x @y @blur @spread rgba(0, 0, 0, @alpha);
# }
#
#
# .border-radius (@radius: 5px) {
# 	-webkit-border-radius: @radius;
# 	-moz-border-radius:    @radius;
# 	border-radius:         @radius;
#
# 	-moz-background-clip:    padding;
# 	-webkit-background-clip: padding-box;
# 	background-clip:         padding-box;
# }
# .border-radiuses (@topright: 0, @bottomright: 0, @bottomleft: 0, @topleft: 0) {
# 	-webkit-border-top-right-radius:    @topright;
# 	-webkit-border-bottom-right-radius: @bottomright;
# 	-webkit-border-bottom-left-radius:  @bottomleft;
# 	-webkit-border-top-left-radius:     @topleft;
#
# 	-moz-border-radius-topright:        @topright;
# 	-moz-border-radius-bottomright:     @bottomright;
# 	-moz-border-radius-bottomleft:      @bottomleft;
# 	-moz-border-radius-topleft:         @topleft;
#
# 	border-top-right-radius:            @topright;
# 	border-bottom-right-radius:         @bottomright;
# 	border-bottom-left-radius:          @bottomleft;
# 	border-top-left-radius:             @topleft;
#
# 	-moz-background-clip:    padding;
# 	-webkit-background-clip: padding-box;
# 	background-clip:         padding-box;
# }
#
# .opacity (@opacity: 0.5) {
# 	-webkit-opacity: 	@opacity;
# 	-moz-opacity: 		@opacity;
# 	opacity: 		@opacity;
# }
#
# .gradient (@startColor: #eee, @endColor: white) {
# 	background-color: @startColor;
# 	background: -webkit-gradient(linear, left top, left bottom, from(@startColor), to(@endColor));
# 	background: -webkit-linear-gradient(top, @startColor, @endColor);
# 	background: -moz-linear-gradient(top, @startColor, @endColor);
# 	background: -ms-linear-gradient(top, @startColor, @endColor);
# 	background: -o-linear-gradient(top, @startColor, @endColor);
# }
# .horizontal-gradient (@startColor: #eee, @endColor: white) {
#  	background-color: @startColor;
# 	background-image: -webkit-gradient(linear, left top, right top, from(@startColor), to(@endColor));
# 	background-image: -webkit-linear-gradient(left, @startColor, @endColor);
# 	background-image: -moz-linear-gradient(left, @startColor, @endColor);
# 	background-image: -ms-linear-gradient(left, @startColor, @endColor);
# 	background-image: -o-linear-gradient(left, @startColor, @endColor);
# }
#
# .animation (@name, @duration: 300ms, @delay: 0, @ease: ease) {
# 	-webkit-animation: @name @duration @delay @ease;
# 	-moz-animation:    @name @duration @delay @ease;
# 	-ms-animation:     @name @duration @delay @ease;
# }
#
# .transition (@transition) {
# 	-webkit-transition: @transition;
# 	-moz-transition:    @transition;
# 	-ms-transition:     @transition;
# 	-o-transition:      @transition;
# }
# .transform(@string){
# 	-webkit-transform: @string;
# 	-moz-transform: 	 @string;
# 	-ms-transform: 		 @string;
# 	-o-transform: 		 @string;
# }
# .scale (@factor) {
# 	-webkit-transform: scale(@factor);
# 	-moz-transform: 	 scale(@factor);
# 	-ms-transform: 		 scale(@factor);
# 	-o-transform: 		 scale(@factor);
# }
# .rotate (@deg) {
# 	-webkit-transform: rotate(@deg);
# 	-moz-transform: 	 rotate(@deg);
# 	-ms-transform: 		 rotate(@deg);
# 	-o-transform: 		 rotate(@deg);
# }
# .skew (@deg, @deg2) {
# 	-webkit-transform:       skew(@deg, @deg2);
# 	-moz-transform: 	 skew(@deg, @deg2);
# 	-ms-transform: 		 skew(@deg, @deg2);
# 	-o-transform: 		 skew(@deg, @deg2);
# }
# .translate (@x, @y:0) {
# 	-webkit-transform:       translate(@x, @y);
# 	-moz-transform: 	 translate(@x, @y);
# 	-ms-transform: 		 translate(@x, @y);
# 	-o-transform: 		 translate(@x, @y);
# }
# .translate3d (@x, @y: 0, @z: 0) {
# 	-webkit-transform:       translate3d(@x, @y, @z);
# 	-moz-transform: 	 translate3d(@x, @y, @z);
# 	-ms-transform: 		 translate3d(@x, @y, @z);
# 	-o-transform: 		 translate3d(@x, @y, @z);
# }
# .perspective (@value: 1000) {
# 	-webkit-perspective: 	@value;
# 	-moz-perspective: 	@value;
# 	-ms-perspective: 	@value;
# 	perspective: 		@value;
# }
# .transform-origin (@x:center, @y:center) {
# 	-webkit-transform-origin: @x @y;
# 	-moz-transform-origin:    @x @y;
# 	-ms-transform-origin:     @x @y;
# 	-o-transform-origin:      @x @y;
# }
