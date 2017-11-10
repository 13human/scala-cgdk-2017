import model._

class MyStrategy extends Strategy {
   def move(me: Player, world: World, game: Game, move: Move) {
    if (world.getTickIndex == 0) {
      move.setAction(ActionType.CLEAR_AND_SELECT)
      move.setRight(world.getWidth)
      move.setBottom(world.getHeight)
    } else {
      move.setAction(ActionType.MOVE)
      move.setX(world.getWidth / 2.0D)
      move.setY(world.getHeight / 2.0D)
    }
  }
}
