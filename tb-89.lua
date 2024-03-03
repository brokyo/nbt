-- Minimalist Chime Composition Tool Prototype
-- A tool for scheduling and layering short, minimalist musical patterns inspired by Japanese evening chimes and utilitarian polyrhythms from simple machines.

-- Libraries and Global Variables
local MusicUtil = require "musicutil" -- For musical scale generation and note utilities
local lattice = require "lattice" -- For managing rhythmic patterns and sequence timing
local my_lattice = lattice:new{ppqn = 96}
local screen_index = 1 -- For navigating through screens

-- Global settings
local mode = "major" -- Default mode
local key = "C" -- Default key
local scale = MusicUtil.generate_scale_of_length(MusicUtil.note_num_for_name(key .. "3"), mode, 8)
local global_bpm = 120 -- BPM for the universal clock

-- Grid connection
g = grid.connect()


-- Voices setup
local voices = {
  -- Placeholder for voice configurations
}

-- Grid orientation and dimensions
local grid_orientation = 90
local grid_width = 8
local grid_height = 16

-- Function to switch between UI screens
function switch_screen(d)
  screen_index = util.clamp(screen_index + d, 1, 2) -- Assuming 2 main screens for now; adjust as needed
  redraw()
end

-- Global Configuration Screen
function draw_global_config()
  screen.clear()
  screen.move(10,30)
  screen.text("Global Config - Key: " .. key .. " Mode: " .. mode)
  screen.update()
end

-- Voice Configuration Screen
function draw_voice_config(voice_num)
  local voice = voices[voice_num]
  screen.clear()
  screen.move(10, 30)
  screen.text("Voice " .. voice_num .. " Config")
  -- Add more details as needed based on voice parameters
  screen.update()
end

-- Grid Configuration and Interaction
function configure_grid()
  -- Grid setup and interaction logic goes here
  -- Consider rotations and mappings based on updated brief
end

-- Main pattern management function using lattice
function manage_pattern(voice)
  -- Pattern play, pause, and loop management using lattice
end

-- Main drawing function for UI
function redraw()
  if screen_index == 1 then
    draw_global_config()
  else
    draw_voice_config(screen_index - 1) -- Assumes the first screen is global config
  end
end

-- Encoder and Key Input Handlers
function enc(n, d)
  if n == 1 then
    switch_screen(d)
  end
  -- Add more encoder handling as needed for parameter adjustments
end

-- Initialization
function init()
  -- Initialize sequences, UI, and any global settings
  my_lattice:start()
end

-- Add any additional cleanup or utility functions as necessary
