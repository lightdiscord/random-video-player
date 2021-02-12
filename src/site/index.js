const video = document.querySelector("video");

function shuffle(array) {
  var currentIndex = array.length, temporaryValue, randomIndex;

  // While there remain elements to shuffle...
  while (0 !== currentIndex) {

    // Pick a remaining element...
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex -= 1;

    // And swap it with the current element.
    temporaryValue = array[currentIndex];
    array[currentIndex] = array[randomIndex];
    array[randomIndex] = temporaryValue;
  }

  return array;
}

async function fetchLinks() {
	const response = await fetch("./medias.json", { cache: "no-store" });
	return response.json();
};

async function main() {
	const links = await fetchLinks();
	console.log(links)

	shuffle(links);

	function next() {
		console.debug("Next requested");
		const src = links[Math.floor(Math.random() * links.length)];
		video.src = src;
		video.load();
		video.play();
	}

	window.next = next;
	next();

	video.addEventListener("ended", () => next());
	document.addEventListener("keydown", ({ key }) => {
		if (key === "n") next();
	});
}

main();
