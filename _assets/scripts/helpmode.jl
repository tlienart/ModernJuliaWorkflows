using Replay

instructions = """
# typing ?
?Integer
"""

replay(instructions, use_ghostwriter=true, cmd="-q --color=yes")
