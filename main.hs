import Graphics.Gloss

----------- main

main :: IO ()
main = animate window background sequenceLines

----------- gloss set up
background :: Color
background = black

window :: Display
window = InWindow "INF1A COMP" (600,600) (10,10)

sequenceLines :: Float -> Picture
sequenceLines t = pictures ([color white $ animateNLinesOne 15 t] ++ [color red $ animateNLinesTwo 15 t] 
                            ++ [color green $ animateNLinesThree 15 t] ++ [color blue $ animateNLinesFour 15 t])

----------- graphs

--white
genPoints1 :: Float -> Point
genPoints1 t = (100 * cos(t) + 12 * sin(t/8) + 95, 100 * sin(t) + 100 * cos(t/3) + 95)

genPoints2 :: Float -> Point
genPoints2 t = (100 * cos(t/5) + 95, 100 * sin(t) + 95)

--red
genPoints3 :: Float -> Point
genPoints3 t = (-(100 * cos(t/5) + 95), -(100 * sin(t) + 95))

genPoints4 :: Float -> Point
genPoints4 t = (-(100 * cos(t) + 12 * sin(t/8) + 95), -(100 * sin(t) + 100 * cos(t/3) + 95))

--green
genPoints5 :: Float -> Point
genPoints5 t = ((80 * sin(t) + 200) , (80 * cos(t) - 200))

genPoints6 :: Float -> Point
genPoints6 t = ((40 * cos(t/4) + 200) , (40 * cos(t) - 200))

--blue
genPoints7 :: Float -> Point
genPoints7 t = (-(80 * sin(t) + 200) , -(80 * cos(t) - 200))

genPoints8 :: Float -> Point
genPoints8 t = (-(40 * cos(t/4) + 200) , -(40 * cos(t) - 200))

-- maps a line between points generated in the functions above - the points change as time goes on
--white
animateLineOne :: Float -> Float -> Picture
animateLineOne n t = pictures [line [genPoints1 (t-n), genPoints2 (t-n)]]

animateNLinesOne :: Float -> Float -> Picture
animateNLinesOne n t = pictures [animateLineOne p t | p <- [0,0.1..(n/10)]]

--red
animateLineTwo :: Float -> Float -> Picture
animateLineTwo n t = pictures [line [genPoints3 (t-n), genPoints4 (t-n)]]

animateNLinesTwo :: Float -> Float -> Picture
animateNLinesTwo n t = pictures [animateLineTwo p t | p <- [0,0.1..(n/10)]]

--green
animateLineThree :: Float -> Float -> Picture
animateLineThree n t = pictures [line [genPoints5 (t-n), genPoints6 (t-n)]]

animateNLinesThree :: Float -> Float -> Picture
animateNLinesThree n t = pictures [animateLineThree p t | p <- [0,0.1..(n/10)]]

--blue
animateLineFour :: Float -> Float -> Picture
animateLineFour n t = pictures [line [genPoints7 (t-n), genPoints8 (t-n)]]

animateNLinesFour :: Float -> Float -> Picture
animateNLinesFour n t = pictures [animateLineFour p t | p <- [0,0.1..(n/10)]]