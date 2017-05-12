<browser-tabs>
	<span each={ tabs } onclick={ onClickTab } class={ noselect: 1, selected: parent.currentURL == url }>
		{ name }
  	</span>

	<script>
		this.tabs = [
			{ name: "All Music", url: "browse" },
			{ name: "Random Albums", url: "random" },
			{ name: "Recently Added", url: "recent" }
		];

		route(function(currentURL, a) {
			this.currentURL = currentURL || this.tabs[0].url;
		}.bind(this));

		onClickTab(e) {
			route(e.item.url);
		}
	</script>

	<style>
		span {
			color: #BBB;
		}

		span + span {
			margin-left: 20px;
		}

		.selected {
			color: #FFF;
			border-bottom: 2px solid #44C8F1;
		}
	</style>

</browser-tabs>