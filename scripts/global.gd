extends Node

@onready var coal : int = 22
@onready var wood : int = 22
@onready var wheat : int = 0

@onready var miners : int = 0
@onready var lumberjacks : int = 0
@onready var farmers : int = 0

@onready var minerCost : int = 10
@onready var lumberCost : int = 10
@onready var farmerCost : int = 10


@onready var coalModifier : float = 1
@onready var woodModifier : float = 1
@onready var wheatModifier : float = 1

@onready var maxLimit : int = 1000000

@onready var totems : int = 0
@onready var unlockedCards : int = 0

@onready var inWolf : bool = false
