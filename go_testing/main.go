package main

import (
	"time"

	"go.uber.org/zap"
)

func main() {
	config := zap.NewProductionConfig()

	config.OutputPaths = []string{"stdout", "testlogfile.txt"}

	logger, _ := config.Build()
	sugar := logger.Sugar()

	defer logger.Sync()

	sugar.Infow("failed to fetch URL",
		"url", "http://example.com",
		"attempt", 3,
		"backoff", time.Second,
	)

	sugar.Infow("failed to fetch URL",
		"url", "http://example.com",
		"attempt", 3,
		"backoff", time.Second,
		zap.String("thing", "value"),
	)

	sugar.Infow("failed to fetch URL",
		"url", "http://example.com",
		"attempt", 3,
		"backoff", time.Second,
	)

	sugar.Infow("failed to fetch URL",
		"url", "http://example.com",
		"attempt", 3,
		"backoff", time.Second,
	)

	sugar.Infow("failed to fetch URL",
		"url", "http://example.com",
		"attempt", 3,
		"backoff", time.Second,
	)
}
