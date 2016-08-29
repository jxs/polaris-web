<browser>
	<h2>File Browser</h2>

	<breadcrumbs></breadcrumbs>

	<ul>
		<li each={ browseResults } onclick={ onClickItem }>
			{ fields.display_name }
		</li>
	</ul>

	<script>
		reset() {
			this.browseResults = [];
		}

		browse(path) {
			fetch('api/browse/' + path)
			.then(function(res) {
				return res.json();
			})
			.then(function(data) {
				var length = data.length;
				for (var i = 0; i < length; i++) {
					data[i].fields = data[i].fields[0];
				}
				
				this.reset();
				this.browseResults = data;
				this.tags.breadcrumbs.setCurrentPath(path);
				this.update();
			}.bind(this));
		}

		onClickItem(e) {
			var variant = e.item.variant;
			if (variant == "Directory") {
				this.browse(e.item.fields.path);
			} else if (variant == "Song") {
				eventBus.trigger("browser:queue", e.item);
			}
		}

		eventBus.on("breadcrumbs:backtrack", function(path) {
			this.browse(path);
		}.bind(this));

		this.reset();
		this.browse("");
	</script>

</browser>