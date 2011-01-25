task :ci do
  Rake::Task['spec'].invoke
end

