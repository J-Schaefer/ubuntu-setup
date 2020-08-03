# Installation of franka ROS package with libfranka using Xstow

This description explains how to install the library libfranka and the Franka ROS package using Xstow.
This makes it unnecessary to give the library path when running catkin_make on the workspace.

```bash
sudo apt install build-essential cmake git libpoco-dev libeigen3-dev

cd ~/local/src # assuming your Xstow directory is in that folder
git clone --recursive https://github.com/frankaemika/libfranka

cd ~/local/DIR/
mkdir libfranka
cd libfranka/
cmake -DCMAKE_BUILD_TYPE=Release ../../src/libfranka/
cmake --build .
cd ..
xstow libfranka/


mkdir -p ~/franka_ws/src/ # or go to your workspace
cd ~/franka_ws
catkin build
git clone --recursive https://github.com/frankaemika/franka_ros src/franka_ros

rosdep install --from-paths src --ignore-src --rosdistro melodic -y --skip-keys libfranka

catkin build -DCMAKE_BUILD_TYPE=Release
source devel/setup.sh
```

## Install missing packages

```bash
# MoveIt Commander
sudo apt install ros-melodic-moveit-commander
# Joint trajectory controller
sudo apt install ros-melodic-joint-trajectory-controller
```

## Xstow

Installation via:

```bash
  sudo apt install xstow
```

To install and use Xstow, one needs to modify the environment variables.
For that put the following into the `.bashrc` file.

```bash
export PYTHON_VERSION=$(basename $(readlink -e $(which python)))
export PYTHON3_VERSION=$(basename $(readlink -e $(which python3)))
export PATH=${HOME}/local/bin:${HOME}/local/sbin:${HOME}/local/usr/bin:${PATH}
export LD_LIBRARY_PATH=${HOME}/local/lib:${HOME}/local/usr/lib:${LD_LIBRARY_PATH}
export LIBRARY_PATH=${LD_LIBRARY_PATH}:${LIBRARY_PATH}
export CPATH=${HOME}/local/include:${HOME}/local/usr/include:${CPATH}
export LDFLAGS="-L${HOME}/local/lib ${LDFLAGS}"
export PKG_CONFIG_PATH=${HOME}/local/lib/pkgconfig
export CMAKE_INCLUDE_PATH=${CPATH}
export CMAKE_LIBRARY_PATH=${LIBRARY_PATH}
export PYTHONPATH=${HOME}/local/lib/python/site-packages:${HOME}/local/lib/python3/site-packages:${HOME}/local/lib/${PYTHON_VERSION}/site-packages:${HOME}/local/lib/${PYTHON_VERSION}/dist-packages:${HOME}/local/lib/${PYTHON3_VERSION}/site-packages:${HOME}/local/lib/${PYTHON3_VERSION}/dist-packages:${HOME}/local/lib/python/dist-packages:${HOME}/local/lib/python3/dist-packages:${PYTHONPATH}
```

Make the following folder structure:

```bash
mkdir -p local/src
mkdir -p local/DIR
```

### Example

Download the source code to local/src and then compile it setting the installation directory to DIR/name-of-project:

```bash
cd local/src
wget http://example.com/example.tar.gz
tar -xzf example.tar.gz
cd example
./configure --prefix=${HOME}/local/DIR/example
make -j$((`nproc`+1)) # build with one more thread than the CPU offers
make install
# Xstow it!
cd ~/local/DIR
xstow example
```

The last step creates symbolic links one directory up, in effect enabling the program
Now the example project is as useful as if it would be installed in the system directories.

To disable example:

```bash
cd ~/local/DIR
xstow -D example
```

The description regarding Xstow was partially taken from [here](https://wiki.arcoslab.org/doku.php?id=tutorials:using_xstow_for_local_installations).
