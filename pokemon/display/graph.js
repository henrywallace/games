var width = 500,
    height = 500;

var canvas = document

var svg = d3.select("body")
	.append("svg")
	.attr("width", width)
	.attr("height", height);

var force;

function update(nodes, links) {
    force = d3.layout.force()
	.size([width, height])
	.nodes(nodes)
	.links(links)
	.linkDistance(200)
	.charge(-300)
	.on("tick", tick)
	.start();

    var circle = svg.append("svg:g").selectAll("circle")
	.data(force.nodes())
	.enter().append("svg:circle")
	.attr("r", function(d) { return 5*Math.sqrt(d.weight); })
	.call(force.drag);

    var link = svg.append("g").selectAll("line")
	.data(force.links())
    	.enter().append("svg:line")
	.attr("class", "links")
	.attr("stroke-width", function(d) { return 5; });

    // var text = svg.append("svg:g").selectAll("g")
    // 	.data(force.nodes())
    // 	.enter().append("svg:g");

    // text.append("svg:text")
    // 	.attr("x", 12)
    // 	.attr("y", ".31em")
    // 	.attr("class", "shadow")
    // 	.text(function(d) { return d.name; });

    // text.append("svg:text")
    // 	.attr("x", 12)
    // 	.attr("y", ".31em")
    // 	.text(function(d) { return d.name; });

    function tick(e) {
	link.attr("x1", function(d) { return d.source.x; })
	    .attr("y1", function(d) { return d.source.y; })
	    .attr("x2", function(d) { return d.target.x; })
	    .attr("y2", function(d) { return d.target.y; });
	circle.attr("transform", function(d) {
	    return "translate(" + d.x + "," + d.y + ")";
	});
	// text.attr("transform", function(d) {
	//     return "translate(" + d.x + "," + d.y + ")";
	// });
    }
}

d3.json('graph.json', function(error, graph) {
    console.log(graph);
    update(graph.nodes, graph.links);
});
