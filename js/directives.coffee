app = angular.module 'app.directives', []

app.directive 'ngMagnify', ['$timeout', ($timeout) ->
	restrict: 'A'
	scope: false
	link: (scope, el, attrs) ->
		el = $(el)

		$small = el.find '.small'
		$large = el.find '.large'
		base = $large.height() / 2

		$timeout ->
			# Get the native width and height
			small_image = new Image()
			small_image.src = $small.attr 'src'

			# Show/hide the magnify element
			el.mouseenter -> $large.show()
			el.mouseleave -> $large.hide()

			small_image.onload = ->
				nw = small_image.width
				nh = small_image.height

				# Now bind the mousemovement
				el.mousemove (e) ->
					offset = el.offset()
					mx = e.pageX - offset.left
					my = e.pageY - offset.top

					if mx < el.width() and my < el.height() and mx > 0 and my > 0
						px = mx - base
						py = my - base
						rx = (Math.round(mx / el.width() * nw - base) * -1)
						ry = (Math.round(my / el.height() * nh - base) * -1)

						$large.css
							left: px
							top: py
							backgroundPosition: "#{rx}px #{ry}px"
]