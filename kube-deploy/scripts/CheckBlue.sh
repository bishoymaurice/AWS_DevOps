while true; do \
  echo "Wait 2 seconds .."
  sleep 2; \
  kubectl get deploy sampleapp-deployment-TARGET_TAG
  READY=$(kubectl get deploy sampleapp-deployment-TARGET_TAG | grep "1/1" | wc -l); \
  [[ "${READY}" != "1" ]] || break; \
done