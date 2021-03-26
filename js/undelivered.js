//setting up canvas
function setup() {
	var canvas = createCanvas(1450, 1250);
	canvas.parent('undelivereddiv');
	background(227, 225, 222);
}

let customerData;

//importing data
function preload() {
	 customerData = loadTable("auction-orders.csv", "csv", "header");
	alert = loadImage("alert.png");
	check = loadImage("check.png");
}

function getSum(total, num) {
	return total + num;
}

function draw() {
	let x = 200;
	let y = 200;
	

// creating array
let customerArray = customerData.getArray();

// stopping after first loop
// getting names, dates, and boxes data 
noLoop();
	for (let i = 0; i < customerArray.length; i++) {
		let customerName = customerArray[i][1];
		let customerDate = customerArray[i][3];
		let customerDelivered = customerArray[i][4];
		let customerBoxes = customerArray[i][5];
		
		
	// header text
	fill('#eb4034');
  textFont('lato', 70);
  textStyle(BOLD);
  text("ALERT: Orders Not Delivered", 250, 100);
		
		
		
		
	// column titles text	
	fill('black');
  textFont('lato', 32);
	text("Name", 140, 170);
	text("Date", 485, 170);
	text("# of Boxes", 765, 170);
	text("Delivery Status", 1065, 170);
	
	// data information displayed
	// creating columns of data

	
	
		// check and alert icons for delivered and undelivered orders
		if (customerDelivered == "n") {
			fill('black');
			textStyle(ITALIC);
  		textFont('lato', 28);
			text(customerBoxes, x+605, y+50);
			text(customerDate, x+255, y+50);
			text(customerName, x-60, y+50);
			y +=50;
	
			image(alert, x+940, y-25, 30, 30);
			y +=50;
				
		}
		
		
		}
	
	
}

// James Madison University
// School of Media Arts and Design
// http://smad.jmu.edu
// Lindsey McKim - mckimla@dukes.jmu.edu
// SMAD 404
// Undelivered Orders Alert
// p5.js
// setup, draw, text