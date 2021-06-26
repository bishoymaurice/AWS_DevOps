while true; do \
    sleep 2; \
    READY=$(kubectl get deploy sampleapp-deployment-TARGET_TAG | grep "1/1" | wc -l); \
    [[ "${READY}" != "1" ]] || break; \
done