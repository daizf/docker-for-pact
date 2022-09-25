## 1.环境
- k8s 1.18
- docker
- chaosmesh 2.0.7
- 离线安装文档参考：https://chaos-mesh.org/zh/docs/2.0.7/offline-installation/

## 2.准备
如果要进行Jvm内部的一些故障注入，则依赖Java Agent的动态修改字节码能力，但是v2.0.7版本不支持Java Agent运行时加载，因此需要webhook方式在Pod创建时候修改原始Pod Yaml定义，增加Init Container来加载Java Agent，详细参考：https://chaos-mesh.org/zh/docs/2.0.7/simulate-jvm-application-chaos/#%E4%BD%BF%E7%94%A8%E9%99%90%E5%88%B6
## 3.实验
### 3.1 Pod故障
https://chaos-mesh.org/zh/docs/2.0.7/simulate-pod-chaos-on-kubernetes/
### 3.2 CPU压力
https://chaos-mesh.org/zh/docs/2.0.7/simulate-heavy-stress-on-kubernetes/
### 3.3 JVM应用故障
kubectl label ns app admission-webhook=enabled
https://chaos-mesh.org/website-zh/docs/simulate-jvm-application-chaos/

