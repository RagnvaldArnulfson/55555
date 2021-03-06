class Music
{
  AudioPlayer title;
  AudioPlayer start;
  AudioPlayer maze;
  AudioPlayer fixed;
  AudioPlayer credits;
  AudioPlayer ending;
  boolean titleSet;
  boolean startSet;
  boolean mazeSet;  
  boolean fixedSet;
  
  Music()
  {
    titleSet = false;
    startSet = false;
    mazeSet = false;
    fixedSet = false;
    title = minim.loadFile("ost/Title.mp3", 2048);
    start = minim.loadFile("ost/Start.mp3", 2048);
    maze = minim.loadFile("ost/Maze.mp3", 2048);
    fixed = minim.loadFile("ost/Fixed.mp3", 2048);
    credits = minim.loadFile("ost/Credits.mp3", 2048);
    ending = minim.loadFile("ost/Ending.mp3", 2048);
  }
  
  void setTitleMusic()
  {
    if(!titleSet)
    {
      title.loop();
      titleSet = true;
    }
  }
  void startSound()
  {
    title.close();
    start.play();
    startSet = true;
  }
  void setMazeMusic()
  {
    start.close();
    if(!mazeSet)
    {
      maze.loop();
      mazeSet = true;
    }
  }
  void closeMazeMusic()
  {
    if(mazeSet)
    {
      maze.close();
      mazeSet = false;
    }
    if(!fixedSet)
    {
      fixed.loop();
      fixedSet = true;
    }
  }
  void setEndingMusic()
  {
    if(fixedSet)
    {
      fixed.close();
      fixedSet = false;
    }
    ending.play();
  }
}
  
