import { useEffect, useRef } from 'react';
import Chart from 'chart.js/auto';

export default function LineChart({ data, labels, type, title }) {
  const chartRef = useRef<Chart | null>(null);
  const canvasRef = useRef<HTMLCanvasElement | null>(null);
  console.log('in linechart: ', data, labels)

  useEffect(() => {
    if (chartRef.current) {
      chartRef.current.destroy();
    }

    const ctx = canvasRef.current?.getContext('2d');
    if (ctx) {
      chartRef.current = new Chart(ctx, {
        type: type,
        data: {
          labels: labels,
          datasets: [{
            label: 'anomalies',
            backgroundColor: '#a3e635',
            borderColor: '#3ECF8E',
            data: data
          }]
        },
        options: {
          responsive: true,
          plugins: {
            title: {
              display: true,
              text: title,
            }
          }
      
        }
      });
    }

    return () => {
      if (chartRef.current) {
        chartRef.current.destroy();
        chartRef.current = null;
      }
    };
  // }, [data, labels]);
  // },[]);
});

  return (
    <div>
      <div>
        <canvas ref={canvasRef} width="1100" height="150"></canvas>
      </div>
    </div>
  );
}
