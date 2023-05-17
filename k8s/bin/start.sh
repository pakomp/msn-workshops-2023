dir=`dirname $0`
absdir=`realpath $dir`
user=`id -u`
echo $absdir
cd $dir
killall sudo > /dev/null
sudo apt install jq -y > /dev/null
echo "Starting server..."
sudo ./k3s server -l $absdir/k3s.log &
sleep 20
sudo cp /etc/rancher/k3s/k3s.yaml $absdir
sudo chown $user k3s.yaml
export KUBECONFIG="$absdir/k3s.yaml"
export PATH="$absdir:$PATH"
export HOME="$absdir"
./get_helm.sh > /dev/null
./kubectx
kubectl get service traefik -n kube-system -o json|jq .status.loadBalancer.ingress[0].ip
cd ..
/usr/bin/bash --rcfile <(echo "PS1='\[\033[01;32m\]\u@k3s:\[\033[00m\]\#:\[\033[01;34m\]\w\[\033[00m\]$ '") -i
