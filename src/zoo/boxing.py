# run_boxing_2players.py

from pettingzoo.atari import boxing_v2
import random


def main():
    # render_mode="human" -> opens a window
    env = boxing_v2.env(render_mode="human")
    env.reset()

    for agent in env.agent_iter():
        obs, reward, termination, truncation, info = env.last()

        # show frame
        env.render()

        if termination or truncation:
            action = None
        else:
            # random action for this agent
            action = env.action_space(agent).sample()

        env.step(action)

    env.close()


if __name__ == "__main__":
    main()
