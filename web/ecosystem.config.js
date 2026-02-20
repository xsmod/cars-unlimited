module.exports = {
    apps: [
        {
            name: 'cars-unlimited',
            script: 'npm',
            args: 'start',
            instances: 1,
            exec_mode: 'fork',
            env: {
                NODE_ENV: 'production'
            },
            error_file: './logs/error.log',
            out_file: './logs/out.log',
            log_file: './logs/combined.log',
            max_memory_restart: '1G',
            merge_logs: true
        }
    ]
};
