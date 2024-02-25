local status_ok, dashboard = pcall(require, 'dashboard')
if not status_ok then
  return
end

local header = {
    "                                                                    ",
    "                                                                    ",
    "                                                                    ",
    "                                                                    ",
    "                                                                    ",
    "                                                                    ",
    "               ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "               ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "               ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡾⠋⠉⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "               ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠃⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "               ⠀⠀⠀⠀⠀⠀⠀⠀⢀⡏⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "               ⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣠⣤⣤⣤⣤⠀⠀       ",
    "               ⠀⠀⠀⠀⠀⠀⠀⠀⡏⠀⠀⠀⠀⢸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠴⠒⠊⠉⠉⠀⠀⣿⣿⣿⠿⠋⠀⠀       ",
    "               ⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢀⡠⠼⠴⠒⠒⠒⠒⠦⠤⠤⣄⣀⠀⢀⣠⠴⠚⠉⠀⠀⠀⠀⠀⠀⠀⠀⣼⠿⠋⠁⠀⠀⠀⠀       ",
    "               ⠀⠀⠀⠀⠀⠀⠀⠀⣇⠔⠂⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀       ",
    "               ⠀⠀⠀⠀⠀⠀⠀⢰⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⠤⠒⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "               ⠀⠀⠀⠀⠀⠀⢀⡟⠀⣠⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⢻⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣤⡤⠤⢴       ",
    "               ⠀⠀⠀⠀⠀⠀⣸⠁⣾⣿⣀⣽⡆⠀⠀⠀⠀⠀⠀⠀⢠⣾⠉⢿⣦⠀⠀⠀⢸⡀⠀⠀⢀⣠⠤⠔⠒⠋⠉⠉⠀⠀⠀⠀⢀⡞       ",
    "               ⠀⠀⠀⠀⠀⢀⡏⠀⠹⠿⠿⠟⠁⠀⠰⠦⠀⠀⠀⠀⠸⣿⣿⣿⡿⠀⠀⠀⢘⡧⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠀       ",
    "               ⠀⠀⠀⠀⠀⣼⠦⣄⠀⠀⢠⣀⣀⣴⠟⠶⣄⡀⠀⠀⡀⠀⠉⠁⠀⠀⠀⠀⢸⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠁⠀       ",
    "               ⠀⠀⠀⠀⢰⡇⠀⠈⡇⠀⠀⠸⡾⠁⠀⠀⠀⠉⠉⡏⠀⠀⠀⣠⠖⠉⠓⢤⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠃⠀⠀       ",
    "               ⠀⠀⠀⠀⠀⢧⣀⡼⠃⠀⠀⠀⢧⠀⠀⠀⠀⠀⢸⠃⠀⠀⠀⣧⠀⠀⠀⣸⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⠃⠀⠀⠀       ",
    "               ⠀⠀⠀⠀⠀⠈⢧⡀⠀⠀⠀⠀⠘⣆⠀⠀⠀⢠⠏⠀⠀⠀⠀⠈⠳⠤⠖⠃⡟⠀⠀⠀⢾⠛⠛⠛⠛⠛⠛⠛⠛⠁⠀⠀⠀⠀       ",
    "               ⠀⠀⠀⠀⠀⠀⠀⠙⣆⠀⠀⠀⠀⠈⠦⣀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠙⢦⠀⠀⠘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "               ⠀⠀⠀⠀⠀⠀⠀⢠⡇⠙⠦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠴⠋⠸⡇⠈⢳⡀⠀⢹⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "               ⠀⠀⠀⠀⠀⠀⠀⡼⣀⠀⠀⠈⠙⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⣷⠴⠚⠁⠀⣀⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "               ⠀⠀⠀⠀⠀⠀⡴⠁⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣆⡴⠚⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "               ⣼⢷⡆⠀⣠⡴⠧⣄⣇⠀⠀⠀⠀⠀⠀⠀⢲⠀⡟⠀⠀⠀⠀⠀⠀⠀⢀⡇⣠⣽⢦⣄⢀⣴⣶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "               ⡿⣼⣽⡞⠁⠀⠀⠀⢹⡀⠀⠀⠀⠀⠀⠀⠈⣷⠃⠀⠀⠀⠀⠀⠀⠀⣼⠉⠁⠀⠀⢠⢟⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "               ⣷⠉⠁⢳⠀⠀⠀⠀⠈⣧⠀⠀⠀⠀⠀⠀⠀⣻⠀⠀⠀⠀⠀⠀⠀⣰⠃⠀⠀⠀⠀⠏⠀⠀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "               ⠹⡆⠀⠈⡇⠀⠀⠀⠀⠘⣆⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⣰⠃⠀⠀⠀⠀⠀⠀⠀⣸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "               ⠀⢳⡀⠀⠙⠀⠀⠀⠀⠀⠘⣆⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⣰⠃⠀⠀⠀⠀⢀⡄⠀⢠⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "               ⠀⠀⢳⡀⣰⣀⣀⣀⠀⠀⠀⠘⣦⣀⠀⠀⠀⡇⠀⠀⠀⢀⡴⠃⠀⠀⠀⠀⠀⢸⡇⢠⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "               ⠀⠀⠀⠉⠉⠀⠀⠈⠉⠉⠉⠙⠻⠿⠾⠾⠻⠓⢦⠦⡶⡶⠿⠛⠛⠓⠒⠒⠚⠛⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
    "                                                                    ",
    "                                                                    ",
    "                                                                    ",
    "                            N E O V I M                             ",
    "                                                                    ",
    "                                                                    ",
    "                                                                    ",
}

-- local header = {
--       "                                                                    ",
--       "                                                                    ",
--       "                                                                    ",
--       "                                                                    ",
--       "            :h-                                  Nhy`               ",
--       "           -mh.                           h.    `Ndho               ",
--       "           hmh+                          oNm.   oNdhh               ",
--       "          `Nmhd`                        /NNmd  /NNhhd               ",
--       "          -NNhhy                      `hMNmmm`+NNdhhh               ",
--       "          .NNmhhs              ```....`..-:/./mNdhhh+               ",
--       "           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
--       "           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
--       "      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
--       " .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
--       " h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
--       " hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
--       " /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
--       "  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
--       "   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
--       "     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
--       "       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
--       "       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
--       "       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
--       "       //+++//++++++////+++///::--                 .::::-------::   ",
--       "       :/++++///////////++++//////.                -:/:----::../-   ",
--       "       -/++++//++///+//////////////               .::::---:::-.+`   ",
--       "       `////////////////////////////:.            --::-----...-/    ",
--       "        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
--       "         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
--       "           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
--       "            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
--       "           s-`::--:::------:////----:---.-:::...-.....`./:          ",
--       "          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
--       "         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
--       "        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
--       "                        .-:mNdhh:.......--::::-`                    ",
--       "                           yNh/..------..`                          ",
--       "                                                                    ",
--       "                                                                    ",
--       "                                                                    ",
--       "                             N E O V I M                            ",
--       "                                                                    ",
--       "                                                                    ",
--       "                                                                    ",
-- }

dashboard.setup({
  theme = "doom",
  config = {
    header = header,
    center = {
      { desc = "  Restore Session         ", action = "lua require('persistence').load()", key = 'SPC s r', desc_hl = "DashboardCenter" },
      { desc = "  Find File               ", action = "Telescope find_files hidden=true theme=dropdown", key = 'SPC f f', desc_hl = "DashboardCenter" },
      { desc = "  Recents                 ", action = "Telescope oldfiles", key = 'SPC f h' , desc_hl = "DashboardCenter"},
      { desc = "  Find Word               ", action = "Telescope live_grep" , key = 'SPC f g' , desc_hl = "DashboardCenter"},
      { desc = "  New Buffer              ", action = "enew" , key = 'SPC b n' , desc_hl = "DashboardCenter"},
      { desc = "  Update Plugins          ", action = "Lazy sync" , key = 'SPC n u' , desc_hl = "DashboardCenter"},
      { desc = "  Settings                ", action = "edit $MYVIMRC" , key = 'SPC n e' , desc_hl = "DashboardCenter"},
      { desc = "  Exit                    ", action = "exit" , key = 'SPC Q' , desc_hl = "DashboardCenter"}
    }
  },
})
