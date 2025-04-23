alias vz="cd ~/git/PZ-RIS/vzug"

set -gx VZ_ARTIFACTORY_USERNAME techuser-ri-vz-readonly-prod
set -gx VZ_ARTIFACTORY_PASSWORD eyJ2ZXIiOiIyIiwidHlwIjoiSldUIiwiYWxnIjoiUlMyNTYiLCJraWQiOiJwSlQtbVljWXlNQURJaHJPVWxETl9qRG9KN013cEFhd1JESTBVSVlPUEZjIn0.eyJzdWIiOiJqZmFjQDAxZzU0d2ZjdHZhOTV2MXl4YWR0eXkxcnA5L3VzZXJzL3RlY2h1c2VyLXJpLXZ6LXJlYWRvbmx5LXByb2QiLCJzY3AiOiJhcHBsaWVkLXBlcm1pc3Npb25zL3VzZXIiLCJhdWQiOiIqQCoiLCJpc3MiOiJqZmFjQDAxZzU0d2ZjdHZhOTV2MXl4YWR0eXkxcnA5IiwiZXhwIjoxNzYxMTI0NDM0LCJpYXQiOjE3Mjk1ODg0MzQsImp0aSI6IjE1ZGUyMzI1LWY4MmYtNGMyYS05ODZmLWY5MmE1YTMxODVkNCJ9.NGRmq2c4gdXVt6wFk-2AXIubyzI3WPkRy3mpNEM8klcW-64MTP11plV_Jiv2Xk51GumcKBkGBan16A0L8JIQxUpoLbV-kTQdY0KV0gJad91i2gREOqt0PaY-1LCopdAysRw1X9sb4E9cQsZJHOgJqTBRSzPf8QvSTCTx2z-usg0mG3dyF_YH6xGhB9bL1N0ga_kfuzr7Im4SnW_ZlvCh5LmePAOjhiu744-OO4f2XR2aiLEQe-cwAww0Hxl75BCs8CqaNu66fqnFqUQ34WjtE1HSizMOE5IfQtOUUMb7fiMcqEbTWqPscuPp9Q-YN-7B28bTYdbrWZZ1Fc6d207nog
set -gx GITLAB_HOST ssh.git.tech.rz.db.de

function hd
helm diff upgrade "$argv" -n "$argv" . -f values.yaml -f secrets://k8s-secrets.yaml -f secrets://../../../pipeline-secrets/deployment-pipeline-secrets/global-k8s-secrets.yaml
end

function hd0
helm diff upgrade "$argv" -n "$argv" . -f values.yaml -f secrets://k8s-secrets.yaml -f secrets://../../../pipeline-secrets/deployment-pipeline-secrets/global-k8s-secrets.yaml -C 0
end

function ts
    source ~/git/db-inner-source/tokenschleuder/venv/bin/activate.fish
    ~/git/db-inner-source/tokenschleuder/tokenschleuder.py --store -l arn:aws:iam::562983789272:role/VZugCrewPrd
end

set -x TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE /var/run/docker.sock
set -x DOCKER_HOST unix://{$HOME}/.colima/docker.sock

function mongo
    kubectl exec -it deployment.apps/mongohelper -- /mongo.sh
end
