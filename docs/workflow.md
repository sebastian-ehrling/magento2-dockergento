# Workflow

The following guide shows you the normal development workflow using dockergento.

#### 1. Start containers

```
dockergento start
```
	
#### 2. Install/update dependecies with composer

```
dockergento composer <install/update>
```

#### 3. Develop code normally inside `magento/app`

While developing you might need to execute magento commands like `cache:flush` for example

```
dockergento magento <command>
```

#### 4. Working on frontend

```
dockergento grunt exec:<theme>
dockergento grunt watch
```

**NOTE:** You might also need to disable your browser cache. For example in Chrome:

* `Open inspector > Settings > Network > Disable cache (while DevTools is open)`

#### 5. Working on vendor modules [Mac only]

If you are developing code in a vendor module, you need to start unison watcher to sync files between host and container.

```
dockergento watch <magento_dir>/vendor/<vendor_name>/<module_name>
```

#### 6. xdebug

* Enable xdebug

	```
	dockergento debug-on
	```
		
* Configure xdebug in PHPStorm (Only first time)

	* [PHPStorm + Xdebug Setup](./xdebug_phpstorm.md)

* Sync generated **[Mac only]** 

	Because this folder is not binded for performance reasons, you need to sync it manually, so debugger finds the code in your host.

	```
	dockergento mirror-container generated
	```
		
	If you edit vendor files while debugging, you have to manually transfer the files into the container
		
	```
	dockergento mirror-host vendor/<subfolder_path>
	```
		
* Disable xdebug when finish 

	Environment is 10x slower when xdebug is enabled!

	```
	dockergento debug-off
	```
 
#### 7. Execute tests

* All tests

	```
	dockergento test-unit
	dockergento test-integration
	```
	
* Only specific files

	```
	dockergento test-unit <test-file-path>
	dockergento test-integration <test-file-path>
	```
