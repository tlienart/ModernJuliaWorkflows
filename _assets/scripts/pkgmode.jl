using Replay

instructions = """
# typing ]
]status
"""

replay(instructions, use_ghostwriter=true, cmd="-q --color=yes")
