raw = {
  cube = [[
    <svg width='50' height='50'>
      <rect width='50' height='50' rx ='5' fill='#ffffff'/>
    </svg>
  ]],

  rect = [[
    <svg width='200' height='40'>
      <rect width='200' height='40' rx ='10' fill='#ffffff'/>
    </svg>
  ]],
}

toSVG = {
  cube = svgCreate(50, 50, raw['cube']),
  rect = svgCreate(200, 40, raw['rect'])
}