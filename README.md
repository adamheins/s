# s

A simple tool for easily sourcing shell scripts. Scripts are located in the
`$S_DIR` directory, defined in `s.sh` as `~/.s`. Scripts placed under `$S_DIR`
(including in subdirectories) can be sourced by simply typing
```
> s path/to/script.sh
```
where the script is located at `$S_DIR/path/to/script.sh`. The real convenience
of this tool is the fact that these paths can be autocompleted with tab,
allowing quick sourcing from anywhere. Completion scripts are provided for both
bash and zsh.

## Examples

### A long directory name

Suppose you have some long directory names you need to access now and then for
command-line tools, but it is a pain to type them out. For example, let's work
with `~/very/long/path/i/dont/want/to/type/each/time`. We can just make a
script `$S_SIR/long.sh` which contains
```
echo ~/very/long/path/i/dont/want/to/type/each/time
```
Now I can easily use it like so:
```
> ls $(s long.sh)
```

### ROS

Suppose I have different robots or machines I want to communicate with (at
different times) using the Robot Operating System
([ROS](https://www.ros.org/)). To do so, I need to change the `$ROS_IP` and
`$ROS_MASTER_URI` environment variables. I certainly don't want to type out the
required IP addresses each time (and in each different shell window I may be
using!). Simply create a script `$S_DIR/ros/myrobot.sh` with something like
```
export ROS_IP=<my IP address>
export ROS_MASTER_URI=http://<ROS master IP address>:11311

# echo the results
echo ROS_MASTER_URI=$ROS_MASTER_URI
echo ROS_IP=$ROS_IP
```
To switch back to using your local computer as the ROS master, use the script
`$S_DIR/ros/local.sh` containing
```
export ROS_MASTER_URI=http://localhost:11311
unset ROS_IP
unset ROS_HOSTNAME

echo ROS_MASTER_URI=$ROS_MASTER_URI
echo Unset ROS_IP and ROS_HOSTNAME
```

## Installation

1. Clone this repository:
   ```
   git clone https://github.com/adamheins/s ~/path/to/s
   ```
2. Arrange for `s.sh` to be automatically sourced. For example, with bash this
   can be accomplished by adding the line `source ~/path/to/s/s.sh` to the
   `~/.bashrc` file.
3. Install completion script. When using bash, one just needs to source the
   script, such as by adding `source ~/path/to/s/s_completion.bash` to
   `~/.bashrc`. When using zsh, one needs to add the `_z` script to the
   `fpath`; this can be accomplished by adding something like
   `fpath=(~/path/to/s $fpath)` to `~/.zshrc`.
4. Create the directory `mkdir $S_DIR` and add some scripts!

## License
MIT
