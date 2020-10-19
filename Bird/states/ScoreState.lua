--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

local BRONZE_MEDAL_IMAGE = love.graphics.newImage('bronze_medal.jpg')
local SILVER_MEDAL_IMAGE =  love.graphics.newImage('silver_medal.jpg')
local GOLDEN_MEDAL_IMAGE = love.graphics.newImage('gold_medal.png')

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)

    if self.score >= 1 and self.score < 3 then -- bronze medal
        love.graphics.draw(BRONZE_MEDAL_IMAGE, VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2, 0, 1, 1, BRONZE_MEDAL_IMAGE:getWidht()/2, BRONZE_MEDAL_IMAGE:getHeight()/2)
        love.graphics.printf('Congrats, you won the bronze medal!', 0, 64, VIRTUAL_WIDTH, 'center')
    elseif self.score >= 3 and self.score < 5 then -- silver medal
        love.graphics.draw(SILVER_MEDAL_IMAGE, VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2, 0, 1, 1, SILVER_MEDAL_IMAGE:getWidht()/2, SILVER_MEDAL_IMAGE:getHeight()/2)
        love.graphics.printf('Congrats, you won the silver medal!', 0, 64, VIRTUAL_WIDTH, 'center')
    elseif self.score >= 5 then -- gold medal
        love.graphics.draw(GOLDEN_MEDAL_IMAGE, VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2, 0, 1, 1, GOLDEN_MEDAL_IMAGE:getWidht()/2, GOLDEN_MEDAL_IMAGE:getHeight()/2)
        love.graphics.printf('Congrats, you won the gold medal!', 0, 64, VIRTUAL_WIDTH, 'center')
    else
        love.graphics.printf('Oops, you lost :( Try again!', 0, 64, VIRTUAL_WIDTH, 'center')
    end

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end