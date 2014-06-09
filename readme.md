# ngMagnify

Inspired by http://thecodeplayer.com/walkthrough/magnifying-glass-for-images-using-jquery-and-css3 to create a re-usable solution in AngularJS for all images.

# Usage

```html
<figure ng-magnify>
	<img ng-src="/path/to/image.jpg" class="small" />
	<div class="large" ng-style="{
		backgroundImage: 'url(/path/to/image.jpg)'
	}"></div>
</figure>
```

And.. that's it. The styles for the actual magnifying glass are very simple and can be found in css/style.sass.

```css
.small
	display: block
	margin: auto

.large
	cursor: crosshair
	z-index: 250
	display: none
	position: absolute
	@include sq(260px)
	@include boxShadow(#{"0 0 0 8px rgba(255,255,255,.85), 0 0 7px 7px rgba(0,0,0,.25), inset 0 0 40px 2px rgba(0,0,0,.25)"})
	@include borderRadius(100%)
	background: #F1F1F1 no-repeat
```
