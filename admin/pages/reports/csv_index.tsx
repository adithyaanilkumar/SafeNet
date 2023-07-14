// import React, { useEffect } from 'react';

// //import * as d3 from "d3";
// import { Chart } from 'chart.js';
// import Navbar from "../components/Navbar"

// //doesnt work yet: tried csv
// //works: takes data from a data var -> line graph

// /*export default function Reports(){
//     return(
//         <div className="container">
//             <Navbar/>
//             <h1>Reports</h1>
//         </div>
//     )
// }
// */

// /*
// import { Chart } from 'chart.js';
// import Papa from 'papaparse';
// import { useEffect, useRef } from 'react';

// export default function Reports(){
//   const canvasRef = useRef<HTMLCanvasElement>(null);

//   useEffect(() => {
//     const csvUrl = 'data/house_sales_ontario.csv';

//     Papa.parse(csvUrl, {
//       download: true,
//       header: true,
//       complete: (results) => {
//         if (canvasRef.current) {
//           const ctx = canvasRef.current.getContext('2d');
//           if (ctx) {
//             const chart = new Chart(ctx, {
//               type: 'bar',
//               data: {
//                 labels: results.data.map((row) => row.id),
//                 datasets: [
//                   {
//                     label: 'Sales',
//                     data: results.data.map((row) => row.cost),
//                     backgroundColor: [
//                       '#FF6384',
//                       '#36A2EB',
//                       '#FFCE56',
//                       '#FF6384',
//                       '#36A2EB',
//                       '#FFCE56',
//                       '#FF6384',
//                     ],
//                     borderColor: '#fff',
//                     borderWidth: 1,
//                   },
//                 ],
//               },
//               options: {
//                 scales: {
//                   y: {
//                     beginAtZero: true,
//                   },
//                 },
//               },
//             });
//           }
//         }
//       },
//     });
//   }, []);

//   return (
//     <div className="w-full h-full">
//       <canvas ref={canvasRef} />
//     </div>
//   );
// };
// */

// //works: takes data from a data var -> line graph
// // /*

// const ChartComponent = () => {
//   useEffect(() => {
//     const data = [
//       { year: 2010, count: 120000 },
//       { year: 2011, count: 200000 },
//       { year: 2012, count: 150000 },
//       { year: 2013, count: 250000 },
//       { year: 2014, count: 220000 },
//       { year: 2015, count: 300000 },
//       { year: 2016, count: 280000 },
//     ];

//     const chart =  new Chart(
//       document.getElementById('anomalies'),
//       {
//         type: 'bar',
//         options: {
//           animation: false,
//           plugins: {
//             legend: {
//               display: false
//             },
//             tooltip: {
//               enabled: false
//             }
//           }
//         },
//         data: {
//           labels: data.map(row => row.year),
//           datasets: [
//             {
//               label: 'Anomalies by year',
//               data: data.map(row => row.count)
//             }
//           ]
//         }
//       }
//     );
  

//     return () => {
//       chart.destroy();
//     };
//   }, []);

//   return(
//     <div className="h-screen w-screeen flex justify-center items-center">
//         <div className="basis-1/5">
//             <Navbar/>
//         </div>
//         <div className="basis-4/5 w-1/5 m-10 p-10">
//             <canvas id="anomalies" />
//         </div>
//     </div>
//   );
// };

// export default ChartComponent;
// // */

// /*
// import { Chart } from 'chart.js';
// import Papa from 'papaparse';
// import { useEffect, useRef } from 'react';

// export default function Reports(){
//   const canvasRef = useRef<HTMLCanvasElement>(null);

//   useEffect(() => {
//     const csvUrl = 'data/house_sales_ontario.csv';

//     /*
//     Papa.parse(csvUrl, {
//       download: true,
//       header: true,
//       complete: (results) => {
//         if (canvasRef.current) {
//           const ctx = canvasRef.current.getContext('2d');
//           if (ctx) {
//             const chart = new Chart(ctx, {
//               type: 'bar',
//               data: {
//                 labels: results.data.map((row) => row.id),
//                 datasets: [
//                   {
//                     label: 'Sales',
//                     data: results.data.map((row) => row.cost),
//                     backgroundColor: [
//                       '#FF6384',
//                       '#36A2EB',
//                       '#FFCE56',
//                       '#FF6384',
//                       '#36A2EB',
//                       '#FFCE56',
//                       '#FF6384',
//                     ],
//                     borderColor: '#fff',
//                     borderWidth: 1,
//                   },
//                 ],
//               },
//               options: {
//                 scales: {
//                   y: {
//                     beginAtZero: true,
//                   },
//                 },
//               },
//             });
//           }
//         }
//       },
//     });
//   }, []);
//     */

// /*
//   return (
//     <div className="w-full h-full">
//       <canvas ref={canvasRef} />
//     </div>
//   );
// };
// */

// /*
// export default function Reports(){
//   function makeChart(players) {
//     // players is an array of objects where each object is something like:
//     // {
//     //   "Name": "Steffi Graf",
//     //   "Weeks": "377",
//     //   "Gender": "Female"
//     // }
  
//     var playerLabels = players.map(function(d) {
//       return d.Name;
//     });
//     var weeksData = players.map(function(d) {
//       return +d.Weeks;
//     });
  
//     const chart = new Chart(
//       document.getElementById('anomalies'), {
//       type: "line",
//       options: {
//         animation: false,
//           plugins: {
//             legend: {
//               display: false
//             },
//             tooltip: {
//               enabled: false
//             }
//           }
//       },
//       data: {
//         labels: playerLabels,
//         datasets: [
//           {
//             data: weeksData
//           }
//         ]
//       }
//     });
//   }
  
//   // Request data using D3
//   d3
//     .csv("https://s3-us-west-2.amazonaws.com/s.cdpn.io/2814973/atp_wta.csv")
//     .then(makeChart);
//   return(
//     <div className="">
//       <div id="anomalies"></div>
//     </div>
//   )
// }
// */